return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			fps = 144,
			timeout = 10,
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "BufEnter",
		cmd = { "TodoTelescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
}
