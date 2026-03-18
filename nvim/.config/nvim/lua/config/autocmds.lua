vim.api.nvim_create_autocmd("FileType", {
    pattern = "man",
    callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.cmd("silent !goimports -w %")
    end,
})
