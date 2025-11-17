local options = {
    -- ensure_installed = {
    --     "bash",
    --     "fish",
    --     "lua",
    --     "luadoc",
    --     "markdown",
    --     "printf",
    --     "python",
    --     "toml",
    --     "vim",
    --     "vimdoc",
    --     "yaml",
    --     "css",
    --     "html",
    --     "hyprlang",
    --     "c_sharp",
    --     "razor",
    --     "ruby",
    -- },
    auto_install = true,

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)

vim.filetype.add({ extension = { axaml = "xml" } })
