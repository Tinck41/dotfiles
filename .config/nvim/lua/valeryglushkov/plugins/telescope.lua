return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		keys = {
			{ "<leader>pf", "n", function() require("telescope.builtin").find_files({}) end },
			{ "<C-p>", "n", require("telescope.builtin").git_files, {} },
			{ "<leader>F", "n", require("telescope.builtin").live_grep, {} },
			{ "<leader>to", "n", require("telescope.builtin").resume, {} },
			{ "<leader>ps", "n", function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") });
			end }
		},
	}
}
