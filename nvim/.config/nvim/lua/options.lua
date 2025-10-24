vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.fillchars = {eob = " "}
    
vim.cmd.colorscheme "ashen"

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#323232", bg = "NONE" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

