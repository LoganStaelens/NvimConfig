local disabled_filetypes = {
	"snacks_picker_list",
	"snacks_picker_input",
	"snacks_picker_preview",
	"snacks_picker_layout",
	"snacks_layout_box",
    "dap-view",
    "dap-repl",
}

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			disabled_filetypes = {
				winbar = disabled_filetypes,
			},
			globalstatus = true,
			component_separators = { left = "", right = " " },
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
			}, --TODO: lost
			lualine_c = {
				{
					"filename",
					path = 1,
                    cond = function ()
                        return not has_value(disabled_filetypes, vim.bo.filetype)
                    end
				},
			},
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
			lualine_c = {},
		},
	},
}
