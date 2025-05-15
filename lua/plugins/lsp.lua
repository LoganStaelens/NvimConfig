return {
	{
		"odoo/odoo-neovim",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--header-insertion=never",
					"--clang-tidy",
				},
			})
			vim.lsp.config("odoo_ls", {
				cmd = {
					vim.fn.expand("$HOME/.local/bin/odoo_ls_server"),
				},
			})

			vim.lsp.enable({ "odoo_ls" })
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
			"odoo/odoo-neovim",
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
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
