local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

local default_servers = {
    "pyright",
    "ts_ls",
    "eslint",
    -- "ruby_lsp",
}

-- lsps with default config
vim.lsp.enable(default_servers)

vim.lsp.config("roslyn", {})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                enable = true,
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
vim.lsp.enable("lua_ls")

vim.lsp.config("gopls", {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- on_attach(client, bufnr)
    end,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gotmpl", "gowork" },
    -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
        },
    },
})
vim.lsp.enable("gopls")

vim.lsp.config("ruby_lsp", {
    filetypes = { "ruby" },

    -- how to start the server. Use a shim or bundle exec to ensure the right Ruby env:
    -- e.g. { "ruby-lsp" }  OR { "bundle", "exec", "ruby-lsp" } OR absolute shim path
    cmd = { "ruby-lsp" },

    -- root detection (adjust to your project if needed)
    root_markers = { "Gemfile", ".git" },

    -- server init options: enable formatter/linters/addon settings here
    init_options = {
        -- make features explicit (avoid relying on unknown defaults)
        enabledFeatures = {
            completion = true,
            hover = true,
            definition = true,
            diagnostics = true,
            documentSymbols = true,
            -- add others if you want
        },

        -- force indexing to include the files in this folder (helps tiny single-file repros)
        indexing = {
            includedPatterns = { "**/*.rb", "**/airplane.rb" }, -- include the script(s)
            -- excludedPatterns = { "vendor/**" }, -- keep empty unless you need excludes
        },
        formatter = "standard", -- example: use 'standard' formatter
        linters = { "standard" }, -- example: enable `standard` linter
        experimentalFeaturesEnabled = true,
        addonSettings = {
            ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
            },
        },
    },

    -- (optional) extra settings you might want to merge/override
})
vim.lsp.enable("ruby_lsp")

-- vim.lsp.config("solargraph", {
--     filetypes = { "ruby" },
--     cmd = { "solargraph", "stdio" },
--     root_markers = { "Gemfile", ".git" },
-- })
-- vim.lsp.enable("solargraph")
