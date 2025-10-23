---@type Base46Table
local M = {}

-- UI palette (base_30) — these keys are expected by base46
M.base_30 = {
    white = "#B4B4B4",
    black = "#121212",
    darker_black = "#020202",
    black2 = "#191919",
    one_bg = "#212121",
    one_bg2 = "#353535",
    one_bg3 = "#323232",
    grey = "#737373",
    grey_fg = "#949494",
    grey_fg2 = "#A7A7A7",
    light_grey = "#D5D5D5",
    red = "#B14242",
    baby_pink = "#DF6464",
    pink = "#DF6464",
    line = "#353535",
    green = "#4A8B8B",
    vibrant_green = "#4A8B8B",
    nord_blue = "#4A8B8B",
    blue = "#4A8B8B",
    seablue = "#4A8B8B",
    yellow = "#E49A44",
    sun = "#E5A72A",
    purple = "#A7A7A7",
    dark_purple = "#B14242",
    teal = "#D87C4A",
    orange = "#C4693D",
    cyan = "#4A8B8B",
    statusline_bg = "#121212",
    lightbg = "#212121",
    pmenu_bg = "#D87C4A",
    folder_bg = "#949494",
}

-- base16 (syntax) — map the user's base16 values here
M.base_16 = {
    base00 = "#121212",
    base01 = "#191919",
    base02 = "#212121",
    base03 = "#353535",
    base04 = "#737373",
    base05 = "#B4B4B4",
    base06 = "#D5D5D5",
    base07 = "#F8F8F2",
    base08 = "#B14242", -- keywords, storage
    base09 = "#4A8B8B", -- constants, numbers
    base0A = "#D87C4A", -- punctuation, operators
    base0B = "#DF6464", -- strings
    base0C = "#C4693D", -- enum members, properties
    base0D = "#B4B4B4", -- functions, classes
    base0E = "#E49A44", -- special characters, YAML anchors
    base0F = "#949494", -- documentation attributes
}

-- OPTIONAL: polish_hl — fine-grained overrides for specific highlight groups or integrations.
M.polish_hl = {
    -- default highlights
    defaults = {
        Comment = { fg = M.base_30.grey, italic = true },
        String = { fg = M.base_30.baby_pink },
        Number = { fg = M.base_30.green },
        Constant = { fg = M.base_30.green },
        Function = { fg = M.base_30.white, bold = true },
        Identifier = { fg = M.base_30.white },
        Keyword = { fg = M.base_30.red },
        Operator = { fg = M.base_30.teal },
        Type = { fg = M.base_30.green, italic = true },
        StorageClass = { fg = M.base_30.red },
        Structure = { fg = M.base_30.green, italic = true },
    },

    -- treesitter / highlight groups
    treesitter = {
        ["@comment"] = { fg = M.base_30.grey, italic = true },
        ["@variable"] = { fg = M.base_30.white },
        ["@variable.builtin"] = { fg = M.base_30.green },
        ["@parameter"] = { fg = M.base_30.teal, italic = true },
        ["@function"] = { fg = M.base_30.white, bold = true },
        ["@function.builtin"] = { fg = M.base_30.light_grey, bold = true },
        ["@function.call"] = { fg = M.base_30.white, bold = true },
        ["@method"] = { fg = M.base_30.white, bold = true },
        ["@method.call"] = { fg = M.base_30.white, bold = true },
        ["@constructor"] = { fg = M.base_30.white, italic = true },
        ["@type"] = { fg = M.base_30.green, italic = true },
        ["@type.builtin"] = { fg = M.base_30.green },
        ["@keyword"] = { fg = M.base_30.red },
        ["@keyword.operator"] = { fg = M.base_30.orange },
        ["@keyword.function"] = { fg = M.base_30.red },
        ["@keyword.return"] = { fg = M.base_30.red },
        ["@conditional"] = { fg = M.base_30.red },
        ["@repeat"] = { fg = M.base_30.red },
        ["@exception"] = { fg = M.base_30.red },
        ["@include"] = { fg = M.base_30.red },
        ["@string"] = { fg = M.base_30.baby_pink },
        ["@string.escape"] = { fg = M.base_30.light_grey },
        ["@string.special"] = { fg = M.base_30.light_grey },
        ["@character"] = { fg = M.base_30.baby_pink },
        ["@number"] = { fg = M.base_30.green },
        ["@boolean"] = { fg = M.base_30.green },
        ["@float"] = { fg = M.base_30.green },
        ["@constant"] = { fg = M.base_30.green },
        ["@constant.builtin"] = { fg = M.base_30.green },
        ["@constant.macro"] = { fg = M.base_30.red },
        ["@property"] = { fg = M.base_30.light_grey },
        ["@field"] = { fg = M.base_30.light_grey },
        ["@namespace"] = { fg = M.base_30.teal, bold = true },
        ["@tag"] = { fg = M.base_30.teal, italic = true },
        ["@tag.attribute"] = { fg = M.base_30.baby_pink },
        ["@tag.delimiter"] = { fg = M.base_30.grey },
        ["@punctuation.delimiter"] = { fg = M.base_30.grey },
        ["@punctuation.bracket"] = { fg = M.base_30.grey },
        ["@punctuation.special"] = { fg = M.base_30.teal },
        ["@operator"] = { fg = M.base_30.teal },
        ["@annotation"] = { fg = M.base_30.grey_fg, italic = true },
        ["@attribute"] = { fg = M.base_30.grey_fg, italic = true },
        ["@module"] = { fg = M.base_30.teal, bold = true },

        -- Specialized types
        ["@type.qualifier"] = { fg = M.base_30.red },
        ["@storageclass"] = { fg = M.base_30.red },
        ["@structure"] = { fg = M.base_30.green, italic = true },

        -- Decorators and annotations
        ["@decorator"] = { fg = M.base_30.red },
        ["@function.macro"] = { fg = M.base_30.red, italic = true },

        -- Diff
        ["@diff.plus"] = { fg = M.base_30.grey_fg2 },
        ["@diff.minus"] = { fg = M.base_30.red },
        ["@diff.delta"] = { fg = M.base_30.orange },
    },

    -- LSP specific highlights
    lsp = {
        ["@lsp.type.class"] = { fg = M.base_30.white, italic = true },
        ["@lsp.type.enum"] = { fg = M.base_30.green, italic = true },
        ["@lsp.type.interface"] = { fg = M.base_30.green, italic = true },
        ["@lsp.type.struct"] = { fg = M.base_30.white, italic = true },
        ["@lsp.type.parameter"] = { fg = M.base_30.teal, italic = true },
        ["@lsp.type.variable"] = { fg = M.base_30.white },
        ["@lsp.type.property"] = { fg = M.base_30.light_grey },
        ["@lsp.type.enumMember"] = { fg = M.base_30.orange },
        ["@lsp.type.function"] = { fg = M.base_30.white, bold = true },
        ["@lsp.type.method"] = { fg = M.base_30.white, bold = true },
        ["@lsp.type.macro"] = { fg = M.base_30.red, italic = true },
        ["@lsp.type.decorator"] = { fg = M.base_30.red },
        ["@lsp.type.namespace"] = { fg = M.base_30.teal, bold = true },
    },
}

-- theme type
M.type = "dark"

-- let base46 apply any user overrides defined in chadrc
M = require("base46").override_theme(M, "ashen")

return M
