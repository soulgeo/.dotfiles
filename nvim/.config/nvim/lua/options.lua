vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }

vim.cmd.colorscheme("ashen")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#323232", bg = "NONE" })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#C53030", bg = "NONE" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.opt.showmode = false

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- set Django template filetype for any .html file inside a "templates" folder
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.html" }, -- run for HTML files
    callback = function(opts)
        local path = vim.api.nvim_buf_get_name(opts.buf) or ""
        -- adjust the path check to match your OS path separator if needed
        if path:match("/templates/") or path:match("\\templates\\") then
            -- set buffer-local filetype to htmldjango (override whatever was set)
            vim.bo[opts.buf].filetype = "htmldjango"
        end
    end,
})
