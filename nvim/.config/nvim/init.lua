vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.env.PATH = os.getenv("PATH")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

require("keymaps")

vim.o.number = true
vim.o.relativenumber = true

vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Visual", { bg = "#2a3a2a", fg = nil })
vim.opt.undofile = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.switchbuf = 'usetab'

-- disable diagnostic signs in the gutter
vim.diagnostic.config({
    signs = false,
    underline = false,
})
