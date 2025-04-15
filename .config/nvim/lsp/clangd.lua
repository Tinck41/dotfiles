return {
	cmd = { 'clangd' },
	root_markers = { '.clangd', 'compile_commands.json' },
	filetypes = { 'c', 'cpp' },
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				}
			}
		}
	}
}
