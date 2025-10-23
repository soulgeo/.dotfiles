vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

require("config.lazy")
require("lazy").setup("plugins")

-- Make the main editor background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- Make floating windows (e.g., popups, LSP info) transparent
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- Make the border of floating windows transparent
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- Make the popup menu transparent
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "javascript"},
    highlight = {enable = true},
    indent = {enable = true},
})


