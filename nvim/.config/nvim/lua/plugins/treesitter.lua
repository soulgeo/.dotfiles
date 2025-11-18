return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
                use_languagetree = true,
            },
            indent = {
                enable = true,
                disable = { "ruby" }, -- keep runtime indent for ruby (recommended)
            },
        })
        vim.filetype.add({ extension = { axaml = "xml" } })
    end,
}
