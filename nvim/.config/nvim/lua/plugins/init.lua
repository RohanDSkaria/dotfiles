return {
    require("plugins.colorschemes"),

    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>y", "<cmd>Yazi<cr>", desc = "Open yazi at the current file" },
            { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open file manager in CWD" },
        },
        opts = {
            open_for_directories = false,
            open_multiple_tabs = true,
            floating_window_border = "rounded",
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(_, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            end

            vim.lsp.config("gopls", {
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_markers = { "go.work", "go.mod", ".git" },
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    gopls = {
                        gofumpt = true,
                        staticcheck = true,
                    },
                },
            })

            vim.lsp.config("clangd", {
                cmd = { "clangd" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.enable("gopls")
            vim.lsp.enable("clangd")
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufReadPost",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "go", "python", "bash", "cpp", "sql" }, -- languages to install
                highlight = { enable = true },
                incremental_selection = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        -- Make it load on the same event as nvim-cmp
        event = "InsertEnter",
        config = function()
            -- Make sure this path is correct!
            -- THIS IS THE CHANGED LINE:
            -- We use vim.fn.stdpath("config") to get the absolute path 
            -- to /home/user/.config/nvim, which resolves symlinks.
            local snippet_path = vim.fn.stdpath("config") .. "/lua/snippets"
            
            require("luasnip.loaders.from_lua").lazy_load({
                paths = { snippet_path } -- Pass the resolved path
            })
        end,
    },

    {
        "williamboman/mason.nvim",
        config = true,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "bashls" },
            }
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local on_attach = function(_, bufnr)
                local opts = { noremap=true, silent=true, buffer=bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end

            vim.lsp.config("bashls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.config("sqlls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end,
    },

    {
        "github/copilot.vim",
    }
}
