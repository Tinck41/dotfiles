return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp"
		}
	},
	config = function()
		vim.api.nvim_set_hl(0, "MyPmenuSel",  { bg = "#d65d0e", fg = "#ebdbb2" })

		require("luasnip.loaders.from_vscode").lazy_load()

		local cmp = require("cmp");
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
	end,
}
