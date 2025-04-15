vim.lsp.config('*', {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			}
		}
	},
	root_markers = { '.git' },
})

vim.lsp.enable({
	'luals',
	'clangd',
	'rust-analyzer',
	'json-lsp',
	'ols',
})

vim.opt.completeopt = "menuone,noselect,popup";

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>N", function() builtin.lsp_dynamic_workspace_symbols({ symbols = { "class", "struct" } }); end)
		vim.keymap.set("n", "<leader>M", function() builtin.lsp_document_symbols({ symbols = { "method" } }); end)
		vim.keymap.set("n", "<leader>V", function() builtin.lsp_document_symbols({ symbols = { "field" } }); end)

		if client.name == "clangd" then
			vim.keymap.set("n", "<leader>ko", function()
				local params = { uri = vim.uri_from_bufnr(0) }
				client.request("textDocument/switchSourceHeader", params, function(err, result)
					if err then
						vim.notify("Switch header/source failed: " .. err.message, vim.log.levels.ERROR)
						return
					end
					if not result then
						vim.notify("No corresponding file found", vim.log.levels.INFO)
						return
					end
					vim.cmd("edit " .. vim.uri_to_fname(result))
				end, 0)
			end, { buffer = args.buf, desc = "Switch between source/header" })
		end
		if client:supports_method('textDocument/defenition') then
			vim.keymap.set("n", "gd", function() builtin.lsp_definitions(); end)
		end
		if client:supports_method('textDocument/reference') then
			vim.keymap.set("n", "gr", function() builtin.lsp_references(); end)
		end
		if client:supports_method('textDocument/implementation') then
			vim.keymap.set("n", "gi", function() builtin.lsp_implementations(); end)
		end
		if client:supports_method('textDocument/completion') then
		end
	end,
})

 vim.diagnostic.config({
	 update_in_insert = true,
	 virtual_lines = { current_line = true }
 })

 require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")

vim.api.nvim_set_hl(0, "MyPmenuSel",  { bg = "#d65d0e", fg = "#ebdbb2" })

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = {
			border = "rounded",
			winhighlight = "Normal:None,FloatBorder:None,CursorLine:MyPmenuSel",
			win
		}
	},
	mapping = cmp.mapping.preset.insert({
		['<C-s>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true })
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})
