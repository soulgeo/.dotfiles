return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
    },
    config = function()
        vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>s", ":TestSuite<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>v", ":TestVisit<CR>", { noremap = true, silent = true })
        vim.cmd("let test#strategy = 'vimux'")
    end,
}
