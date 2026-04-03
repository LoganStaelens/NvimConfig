return {
	"nvim-treesitter/nvim-treesitter",
    branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			ensure_installed = {
				"lua",
                "rust",
				"javascript",
				"python",
				"bash",
				"json",
				"yaml",
				"c",
				"c_sharp",
				"cpp",
				"css",
				"csv",
				"xml",
				"html",
				"glsl",
			},
		})
	end,
}
