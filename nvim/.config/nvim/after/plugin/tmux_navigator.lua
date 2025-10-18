-- ~/.config/nvim/after/plugin/tmux_navigator.lua
-- Ensure tmux-navigator mappings override any buffer-local mappings set later by ftplugin
-- without disabling the plugin's own behavior elsewhere.

-- Helper to set buffer-local mappings (safe pcall)
local function set_buf_maps(bufnr)
    local ok, _ = pcall(function()
        local opts = { noremap = true, silent = true, buffer = bufnr }
        -- delete any leftover buffer-local lhs before setting ours
        pcall(vim.keymap.del, "n", "<C-h>", { buffer = bufnr })
        pcall(vim.keymap.del, "t", "<C-h>", { buffer = bufnr })
        pcall(vim.keymap.del, "n", "<C-j>", { buffer = bufnr })
        pcall(vim.keymap.del, "t", "<C-j>", { buffer = bufnr })
        pcall(vim.keymap.del, "n", "<C-k>", { buffer = bufnr })
        pcall(vim.keymap.del, "t", "<C-k>", { buffer = bufnr })
        pcall(vim.keymap.del, "n", "<C-l>", { buffer = bufnr })
        pcall(vim.keymap.del, "t", "<C-l>", { buffer = bufnr })
        pcall(vim.keymap.del, "n", "<C-\\>", { buffer = bufnr })
        pcall(vim.keymap.del, "t", "<C-\\>", { buffer = bufnr })

        -- set buffer-local mappings so they take precedence over global ones
        vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
        vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
        vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
        vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)
        vim.keymap.set({ "n", "t" }, "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", opts)
    end)
    if not ok then
        vim.notify("tmux_navigator: failed to set buffer maps for buf " .. tostring(bufnr), vim.log.levels.WARN)
    end
end

-- Apply to the current buffer immediately (covers the buffer in which this file was loaded)
set_buf_maps(vim.api.nvim_get_current_buf())

-- Apply for every buffer after its FileType is set (ftplugin usually runs before/at FileType)
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "TermOpen" }, {
    group = vim.api.nvim_create_augroup("TmuxNavigatorBufferMaps", { clear = false }),
    callback = function(args)
        local bufnr = args.buf or vim.api.nvim_get_current_buf()
        set_buf_maps(bufnr)
    end,
})
