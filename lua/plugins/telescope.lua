return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "andrew-george/telescope-themes",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    themes = {
                        persist = {
                            enabled = true,
                            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
                        },
                    },
                },
            })
        end,
    }
}

