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
    cmd = { "bundle", "exec", "ruby-lsp" },
    root_markers = { "Gemfile", ".git" },

    init_options = {
        enabledFeatures = {
            completion = true,
            hover = true,
            definition = true,
            diagnostics = true,
            documentSymbols = true,
        },
        addonSettings = {
            ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
            },
        },
    },
})
vim.lsp.enable("ruby_lsp")

-- vim.lsp.config("solargraph", {
--     filetypes = { "ruby" },
--     cmd = { "bundle", "exec", "solargraph", "stdio" },
--     root_markers = { "Gemfile", ".git", "." },
--     init_options = {
--         -- sending formatting via init options avoids some older formatting issues
--         formatting = true,
--     },
--     settings = {
--         solargraph = {
--             diagnostics = true,
--             formatting = true,
--             completion = true,
--             useBundler = false, -- set true if you want server to use Bundler (see notes)
--             -- bundlerPath = "/absolute/path/to/bundle", -- optional if using useBundler
--         },
--     },
--     flags = {
--         debounce_text_changes = 150,
--     },
-- })
-- vim.lsp.enable("solargraph")
--
-- vim.lsp.config("rubocop", {
--     cmd = { "rubocop", "--lsp" },
--     filetypes = { "ruby" },
--     root_markers = { "Gemfile", ".git", "." },
-- })
-- vim.lsp.enable("rubocop")
