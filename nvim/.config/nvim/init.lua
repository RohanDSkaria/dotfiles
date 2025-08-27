vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.env.PATH = os.getenv("PATH")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.o.number = true
vim.o.relativenumber = true

vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

vim.opt.termguicolors = true
vim.opt.undofile = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.switchbuf = 'usetab'
