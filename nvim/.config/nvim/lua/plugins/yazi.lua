return {
    "mikavilpas/yazi.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>y", "<cmd>Yazi<cr>", desc = "Open yazi at current file" },
    },
    opts = {
        open_for_directories = false,
        open_multiple_tabs = true,
        floating_window_border = "rounded",
    },
}
