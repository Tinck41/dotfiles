require("gruvbox").setup({
	terminal_colors=false,
	overrides = {
		["@lsp.type.method"] = { fg = "#fe8019" },
		["@lsp.type.function"] = { fg = "#ebdbb2" },
		["@lsp.typemod.function.globalScope"] = { fg = "#fe8019" },
		["@lsp.type.class.cpp.builtin"] = { fg = "#fb4934" },
		["@preproc.cpp"] = { fg = "#fb4934" },
		--["@fucntion.macro"] = { fg = "#fb4934" },
		["@lsp.type.enumMember"] = { fg = "#ebdbb2" },
		["@variable.builtin.cpp"] = { fg = "#fb4934" },
		["@function.call"] = { fg = "#fe8019" },
		["@function.method.call"] = { fg = "#fe8019" },
		["@include"] = { fg = "#fb4934" },
		["@type.builtin"] = { fg = "#fb4934" },
		["@auto"] = { fg = "#fb4934" },
		["@type.qualifier"] = { fg = "#fb4934" },
		["@boolean"] = { fg = "#fb4934" },
		["@property"] = { fg = "#c7c061" },
		["@field"] = { fg = "#bdb76b" },
		["@variable"] = { fg = "#83a598" },
		["@attribute"] = { fg = "#ebdbb2" },
		["@storageclass"] = { fg = "#ebdbb2" },
		["@string"] = { fg = "#ebdbb2" },
		["@keyword.import.cpp"] = { fg = "#fb4934" },
		["@keyword.directive.cpp"] = { fg = "#fb4934" },
		["@keyword.storage.cpp"] = { fg = "#ebdbb2" }
	}
})
vim.cmd("colorscheme gruvbox")
