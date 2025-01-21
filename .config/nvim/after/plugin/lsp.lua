local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'clangd',
	'lua_ls',
	'jsonls',
})

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")

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
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true })
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "<leader>ko", ":ClangdSwitchSourceHeader<Cr>")
	vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.hover() end, opts)

	opts = { noremap=true, silent=true }

	local function quickfix()
		vim.lsp.buf.code_action({
			filter = function(a) return a.isPreferred end,
			apply = true
		})
	end
	vim.keymap.set('n', '<leader>qf', quickfix, opts)
end)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
	capabilities = capabilities,
}
lspconfig.lua_ls.setup {
	capabilities = capabilities,
}
lspconfig.jsonls.setup {
	capabilities = capabilities,
}

lsp.setup()

