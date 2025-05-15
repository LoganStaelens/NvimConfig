return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "rose-pine/neovim",
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " "
                    or (e == "warning" and " " or " ")
                    s = s .. n .. sym
                end
                return s
            end,
            numbers = function(opts)
                return string.format('%s', opts.ordinal)
            end,
            close_command = function(n) Snacks.bufdelete(n) end,
            right_mouse_command = function(n) Snacks.bufdelete(n) end,
            offsets = {
                    {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                }
            }
        }
    },
    config = function(_, opts)
        vim.opt.termguicolors = true
        require("bufferline").setup(opts)
    end,
}

