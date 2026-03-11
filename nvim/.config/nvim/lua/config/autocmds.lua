vim.api.nvim_create_autocmd("FileType", {
    pattern = "man",
    callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
    end,
})
