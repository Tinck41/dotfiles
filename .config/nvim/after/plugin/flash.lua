local flash = require("flash")

vim.keymap.set({ "n", "x", "o" }, "s", function() flash.jump() end)
vim.keymap.set({ "n", "x", "o" }, "S",  function() flash.treesitter() end)
vim.keymap.set("o", "r", function() flash.remote() end)
vim.keymap.set({ "o", "x" }, "R", function() flash.treesitter_search() end)
vim.keymap.set("c", "<c-s>", function() flash.toggle() end)

vim.api.nvim_set_hl(0, "FlashLabel",  { bg = "#fb4934", fg = "#ebdbb2" })
