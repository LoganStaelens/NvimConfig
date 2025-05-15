return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").clangd.setup({
				cmd = {
					"clangd",
					"--header-insertion=never",
					"--clang-tidy",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"eslint",
					"lemminx",
					"glsl_analyzer",
					"slangd",
					"html",
					"cssls",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
}
