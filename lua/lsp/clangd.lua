vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--header-insertion=never",
		"--clang-tidy",
	},
    filetypes = { 'c', 'cpp' },

})

vim.lsp.enable("clangd")
