---@type Base46Table
local M = {}

-- UI palette (base_30) — these keys are expected by base46
M.base_30 = {
    white = "#b4b4b4",
    black = "#121212",
    darker_black = "#020202",
    black2 = "#191919",
    one_bg = "#212121",
    one_bg2 = "#535353",
    one_bg3 = "#949494",
    grey = "#535353",
    grey_fg = "#535353",
    grey_fg2 = "#a7a7a7",
    light_grey = "#b4b4b4",
    red = "#B14242",
    baby_pink = "#B14242",
    pink = "#B14242",
    line = "#191919",
    green = "#DF6464",
    vibrant_green = "#DF6464",
    nord_blue = "#b4b4b4",
    blue = "#4A8B8B",
    seablue = "#4A8B8B",
    yellow = "#E49A44",
    sun = "#E49A44",
    purple = "#a7a7a7",
    dark_purple = "#E49A44",
    teal = "#D87C4A",
    orange = "#b4b4b4",
    cyan = "#4A8B8B",
    statusline_bg = "#121212",
    lightbg = "#212121",
    pmenu_bg = "#E49A44",
    folder_bg = "#949494",
}

-- base16 (syntax) — map the user's base16 values here
M.base_16 = {
    base00 = "#020202",
    base01 = "#121212",
    base02 = "#212121",
    base03 = "#535353",
    base04 = "#E49A44",
    base05 = "#d5d5d5",
    base06 = "#C4693D",
    base07 = "#b4b4b4",
    base08 = "#E49A44", -- red_ember
    base09 = "#376969", -- blue
    base0A = "#D87C4A", -- orange_blaze
    base0B = "#DF6464", -- red_glowing
    base0C = "#4A8B8B", -- orange_smolder
    base0D = "#E49A44", -- orange_glow
    base0E = "#B14242", -- red_ember (same as base08)
    base0F = "#949494", -- brown
}

-- OPTIONAL: polish_hl — fine-grained overrides for specific highlight groups or integrations.
-- Keep this small to start; you can expand later.
M.polish_hl = {
    -- default highlights
    defaults = {
        Comment = { fg = M.base_30.grey, italic = true },
    },

    -- treesitter / highlight groups
    treesitter = {
        ["@variable"] = { fg = M.base_30.white },
        ["@function"] = { fg = M.base_30.orange, bold = true },
        ["@comment"] = { fg = M.base_30.grey, italic = true },
        ["@variable"] = { fg = M.base_30.white },
        ["@parameter"] = { fg = M.base_30.one_bg3 },
        ["@function"] = { fg = M.base_30.orange, bold = true },
        ["@method"] = { fg = M.base_30.blue },
        ["@type"] = { fg = M.base_30.blue },
        ["@type.builtin"] = { fg = M.base_30.red },
        ["@keyword"] = { fg = M.base_30.red, italic = true },
        ["@string"] = { fg = M.base_30.green },
        ["@constant"] = { fg = M.base_30.red },
        ["@number"] = { fg = M.base_30.blue },
        ["@property"] = { fg = M.base_30.white },
        ["@constructor"] = { fg = M.base_30.white, bold = true },
        ["@attribute"] = { fg = M.base_30.cyan },
        ["@boolean"] = { fg = M.base_30.vibrant_green },
        ["@operator"] = { fg = M.base_30.teal },
        ["@todo"] = { fg = M.base_30.sun, bold = true },
    },
}

-- theme type
M.type = "dark"

-- let base46 apply any user overrides defined in chadrc
M = require("base46").override_theme(M, "ashen")

return M
