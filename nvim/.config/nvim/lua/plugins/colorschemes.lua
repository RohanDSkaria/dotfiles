return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "soft",
                palette_overrides = {
                    dark0_hard = "#0d0d0d",
                },
            })
            vim.o.background = "dark"
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
                custom_highlights = function(colors)
                    return {
                        Normal       = { bg = "#0a0a0a" },
                        NormalNC     = { bg = "#0a0a0a" },
                        SignColumn   = { bg = "#0a0a0a" },
                        LineNr       = { bg = "#0a0a0a" },
                        StatusLine   = { bg = "#0a0a0a" },
                        WinSeparator = { bg = "#0a0a0a" },
                    }
                end,
            })
            vim.o.background = "dark"
            -- vim.cmd("colorscheme catppuccin")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "main",
                dark_variant = "main",
                highlight_groups = {
                    Normal     = { bg = "#0a0a0a" },
                    NormalNC   = { bg = "#0a0a0a" },
                    SignColumn = { bg = "#0a0a0a" },
                    LineNr     = { bg = "#0a0a0a" },
                    StatusLine = { bg = "#0a0a0a" },
                },
            })
            vim.o.background = "dark"
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
    {
        "oxfist/night-owl.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            -- vim.cmd("colorscheme night-owl")
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            require("vscode").setup({
                italic_comments = false,
                disable_nvimtree_bg = true,
            })
            -- vim.cmd("colorscheme vscode")
            vim.api.nvim_set_hl(0, "Normal", { bg = "#111111" })
        end,
    },
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        priority = 1000,
        config = function()
            vim.opt.termguicolors = true
            vim.o.background = "dark"

            -- vim.cmd.colorscheme("zenwritten")
        end,
    },
}
