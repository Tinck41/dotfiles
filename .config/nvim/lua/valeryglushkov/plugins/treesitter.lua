return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "odin", "rust" },
			sync_install = false,
			auto_install = false,
			ignore_install = { "javascript" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context" ,
		keys = {
			{ "<leader>c", mode = "n", function() require("treesitter-context").toggle() end }
		},
	},
}
