return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
            -- require("config.mason-lspconfig")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {},
        config = function()
            require("config.lspconfig")
        end,
    },
}
