return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"cpp",
				"python",
				"javascript",
				"xml",
				"rust",
				"asm",
				"c_sharp",
				"go",
				"css",
				"glsl",
				"hlsl",
				"html",
				"json",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			-- indent = { enable = true },
		})
	end,
}
