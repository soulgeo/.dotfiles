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

        require("lualine").setup({
            options = {
                theme = custom,
                -- optional: remove separators if you still see pill artifacts
                -- section_separators = "",
                -- component_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = { "filename" },
                lualine_x = { "progress" },
                lualine_y = { "diagnostics", "encoding", "fileformat", "filetype" },
                lualine_z = { "location" },
            },
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
