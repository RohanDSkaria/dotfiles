-- Delete without copying to clipboard
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "d", '"_d', { noremap = true, silent = true })
