vim.keymap.set({"i", "n"}, "<leader>c", function() require("treesitter-context").toggle() end)
