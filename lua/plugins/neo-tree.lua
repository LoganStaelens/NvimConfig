return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{
			"<leader>e",
			"<cmd> Neotree toggle<cr>",
			desc = "Toggle Explorer",
		},
	},
	--@module "neo-tree"
	--@type neotree.Config?
	opts = {
		popup_border_style = "rounded",
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				hide_dotfiles = false,
			},
		},
		default_component_configs = {
			indent = {
				indent_size = 2,
				with_expanders = nil,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
	},
}
