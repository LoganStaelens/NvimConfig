return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
				{
					"branch",
				},
				{
					"diff",
				},
			},
			lualine_c = {},
			lualine_x = {
				"lsp_status",
			},
			lualine_y = {
				{
					"filetype",
				},
				{
					"fileformat",
				},
				{
					"encoding",
				},
			},
			lualine_z = {
				"location",
			},
		},
		winbar = {
			lualine_a = {
				"filename",
			},
			lualine_b = {
				"filesize",
			},
			lualine_c = {
				"diagnostics",
			},
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {
				"filename",
			},
		},
	},
}
