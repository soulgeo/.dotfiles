vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>ex", function()
    require("neo-tree.command").execute({
        toggle = true,
        position = "float", -- request float
        source = "filesystem", -- optional: choose source (filesystem, buffers, git_status)
        -- you can also add 'dir = vim.loop.cwd()' to open at cwd, or 'reveal = true'
    })
end, { desc = "Toggle Neo-tree (float)" })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "p", '"+p', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "d", '"+d', { noremap = true, silent = true })

-- Center line at screen after vertical movement
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "N", "Nzzzv", { noremap = true, silent = true })

-- Kill last search highlight
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { noremap = true, silent = true })
