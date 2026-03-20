return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "go", "python", "bash", "cpp", "sql" },
        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
