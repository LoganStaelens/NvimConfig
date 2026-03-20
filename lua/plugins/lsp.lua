return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"nvim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"glsl_analyzer",
				"html",
				"cssls",
				"tailwindcss",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("clangd", {
				"clangd",
				"--header-insertion=never",
				"--clang-tidy",
			})

			vim.lsp.enable("clangd")
			require("lsp.odoo_ls")
		end,
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				width = 0.5,
				height = 0.7,
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
}
