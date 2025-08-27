return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", 
                integrations = {
                    treesitter = true,
                    lsp = true,
                    gitsigns = true,
                },
            })
            -- vim.cmd("colorscheme catppuccin")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme rose-pine")
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme moonfly")
        end,
    },
}
