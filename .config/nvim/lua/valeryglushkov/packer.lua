vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({ 
		"ellisonleao/gruvbox.nvim",
		as = "gruvbox",
		config = function()
			vim.cmd("colorscheme gruvbox")
		end
	})

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
		requires = {
			{ 'saadparwaiz1/cmp_luasnip' },
			{'rafamadriz/friendly-snippets'}
		}
	})

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}
	use { 'mfussenegger/nvim-dap' }
	use { "jay-babu/mason-nvim-dap.nvim" }
	use { 
		'rcarriga/nvim-dap-ui',
		requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	}
	use { 'lukas-reineke/indent-blankline.nvim' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use { 'nvim-treesitter/playground' }
	use { "christoomey/vim-tmux-navigator" }
	use { "FabijanZulj/blame.nvim" }
	use { "nvim-pack/nvim-spectre" }
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { 
			{"nvim-lua/plenary.nvim"},
			{"nvim-telescope/telescope.nvim"}
		}
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use { 'sphamba/smear-cursor.nvim' }
end)
