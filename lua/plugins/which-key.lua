return {
	"folke/which-key.nvim",
	opts = {
		preset = "modern",
		delay = 500,
		spec = {
			{
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>d", group = "Debugger" },
				{ "<leader>p", group = "Preview" },
				{ "<leader>t", group = "Toggle" },
				{ "<leader>w", group = "Window" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>q", group = "Quit" },
			},
		},
	},
}
