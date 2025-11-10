return {
    -- just produce the default capabilities and keep them accessible
    {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local caps = cmp_nvim_lsp.default_capabilities()
            -- ensure snippet support explicitly (default_capabilities normally does this already)
            caps.textDocument = caps.textDocument or {}
            caps.textDocument.completion = caps.textDocument.completion or {}
            caps.textDocument.completion.completionItem = caps.textDocument.completion.completionItem or {}
            caps.textDocument.completion.completionItem.snippetSupport = true

            -- store capabilities globally so other plugin configs (like lspconfig) can read them
            vim.g.__cmp_lsp_capabilities = caps
        end,
    },

    -- LuaSnip + snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local ls = require("luasnip")

            -- important: enable autosnippets and update on TextChanged so typing /// expands
            ls.config.set_config({
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,
            })

            -- load vscode snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            local s = ls.snippet
            local t = ls.text_node
            local i = ls.insert_node

            -- a basic autosnippet triggered by typing ///
            ls.add_snippets("cs", {
                s({ trig = "///", wordTrig = false, snippetType = "autosnippet" }, {
                    t({ "/// <summary>", "/// " }),
                    i(1, "Short description."),
                    t({ "", "/// </summary>" }),
                    i(0),
                }),
            })
        end,
    },

    -- nvim-cmp (single, complete setup)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            -- local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- helper: words before (for tab behavior)
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-a>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- <-- enable LSP completions (was commented out)
                    { name = "luasnip" }, -- snippets
                }, {
                    { name = "buffer" },
                }),
            })

            -- -- if you want to setup omnisharp here (so it gets the capabilities), do it now:
            -- local ok, lspconfig = pcall(require, "lspconfig")
            -- if ok then
            --     local caps = vim.g.__cmp_lsp_capabilities
            --     if caps then
            --         -- example: omnisharp (change cmd/path or server name to your server if different)
            --         lspconfig.omnisharp.setup({
            --             capabilities = caps,
            --             -- other omnisharp settings you may have...
            --         })
            --     end
            -- end
        end,
    },
}
