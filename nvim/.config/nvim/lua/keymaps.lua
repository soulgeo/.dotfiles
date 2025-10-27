vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
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
