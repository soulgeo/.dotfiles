return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local custom = require("lualine.themes.horizon")

        custom.normal.a.bg = "#B4B4B4"
        custom.insert.a.bg = "#4A8B8B"
        custom.visual.a.bg = "#DF6464"
        custom.command.a.bg = "#D87C4A"
        custom.replace.a.bg = "#E49A44"
        custom.inactive.a.bg = "none"

        custom.normal.b.bg = "#121212"
        custom.insert.b.bg = "#121212"
        custom.visual.b.bg = "#121212"
        custom.command.b.bg = "#121212"
        custom.replace.b.bg = "#121212"
        custom.inactive.b.bg = "#121212"

        custom.normal.c.bg = "none"
        custom.insert.c.bg = "none"
        custom.visual.c.bg = "none"
        custom.command.c.bg = "none"
        custom.replace.c.bg = "none"
        custom.inactive.c.bg = "none"

        -- -- fallback progress table + handler setup (only if get_progress not available)
        -- if vim.lsp.get_progress == nil then
        --     -- table keyed by client_id -> active progress count
        --     _G._lualine_lsp_progress = _G._lualine_lsp_progress or {}
        --     if not _G._lualine_lsp_progress_handler_set then
        --         local orig_handler = vim.lsp.handlers["$/progress"]
        --         vim.lsp.handlers["$/progress"] = function(err, result, ctx, config)
        --             if orig_handler then
        --                 pcall(orig_handler, err, result, ctx, config)
        --             end
        --             if err or not result or not ctx then
        --                 return
        --             end
        --             local client_id = ctx.client_id
        --             if not client_id then
        --                 return
        --             end
        --             local kind = result.value and result.value.kind
        --             if kind == "begin" then
        --                 _G._lualine_lsp_progress[client_id] = (_G._lualine_lsp_progress[client_id] or 0) + 1
        --             elseif kind == "end" then
        --                 _G._lualine_lsp_progress[client_id] =
        --                     math.max(0, (_G._lualine_lsp_progress[client_id] or 1) - 1)
        --             end
        --         end
        --         _G._lualine_lsp_progress_handler_set = true
        --     end
        -- end

        require("lualine").setup({
            options = {
                theme = custom,
                -- optional: remove separators if you still see pill artifacts
                -- section_separators = "",
                -- component_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = {
                    {
                        function()
                            -- wrap call so plugin can be lazy-loaded safely
                            return require("lsp-progress").progress()
                        end,
                        color = { gui = "bold" },
                    },
                },
                lualine_y = { "diagnostics", "encoding", "filetype" },
                lualine_z = { "location" },
            },
        })
        -- and make sure lualine refreshes when progress updates:
        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = "lualine_augroup",
            pattern = "LspProgressStatusUpdated",
            callback = require("lualine").refresh,
        })
        -- Clear StatusLine/StatusLineNC backgrounds (use hi! to cover both GUI/cterm)
        local function clear_statusline_bg()
            vim.cmd([[
        silent! hi! StatusLine guibg=NONE ctermbg=NONE
        silent! hi! StatusLineNC guibg=NONE ctermbg=NONE
      ]])
        end

        -- Apply now and whenever colorscheme changes (prevents overrides)
        clear_statusline_bg()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = clear_statusline_bg,
        })
    end,
}
