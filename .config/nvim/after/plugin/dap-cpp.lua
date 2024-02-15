local dap = require('dap')
local dapui = require('dapui')

require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
	handlers = {},
})

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set("n", '<F5>', function() require('dap').continue() end)
vim.keymap.set("n", '<F10>', function() require('dap').step_over() end)
vim.keymap.set("n", '<F11>', function() require('dap').step_into() end)
vim.keymap.set("n", '<shift><F11>', function() require('dap').step_out() end)
vim.keymap.set("n", '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set("n", '<leader>dq', function() require('dapui').toggle() end)
vim.keymap.set("n", '<leader>do', function() require('dapui').open() end)
vim.keymap.set("n", '<leader>dc', function() require('dapui').close() end)

dap.configurations.c = dap.configurations.cpp

