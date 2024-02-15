local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'clangd',
})

local cmp = require("cmp")

cmp.setup {
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true })
	}),
    sources = {
        { name = 'nvim_lsp' }
    },
}


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

require'lspconfig'.clangd.setup {
    capabilities = capabilities,
}

lsp.setup()

