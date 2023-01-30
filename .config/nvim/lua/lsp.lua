LSP_ON_ATTACH = function(client, buffer_num)
    vim.api.nvim_buf_set_option(buffer_num, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local capabilities = client.server_capabilities

    if capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, buffer_num)
    end

    if capabilities.semanticTokensProvider and capabilities.semanticTokensProvider.full then
        local lsp_group = vim.api.nvim_create_augroup("lsp_semantic_highlighting", {})
        vim.api.nvim_create_autocmd(
            {
                "BufEnter",
                "BufRead",
                "BufWrite",
                "CursorHold",
                "InsertChange",
                "ColorScheme",
                "WinClosed",
            },
            {
                group = lsp_group,
                buffer = buffer_num,
                callback = function()
                    vim.lsp.buf.semantic_tokens_full()
                end
            }
        )
        if capabilities.document_highlight then
            vim.api.nvim_create_autocmd(
                {
                    "BufEnter",
                    "BufRead",
                    "BufWrite",
                    "CursorHold",
                    "InsertChange",
                    "ColorScheme",
                    "WinClosed",
                },
                {
                    group = lsp_group,
                    buffer = buffer_num,
                    callback = function()
                        vim.lsp.buf.document_highlight()
                    end
                }
            )
            vim.api.nvim_create_autocmd(
                {
                    "CursorMoved",
                },
                {
                    group = lsp_group,
                    buffer = buffer_num,
                    callback = function()
                        vim.lsp.buf.clear_references()
                    end
                }
            )
        end
    end
end

local map = require("map")

return {
    {
        "folke/neodev.nvim",
        lazy = false,
        opts = {
            library = {
                plugins = {
                    "nvim-dap-ui",
                },
                types = true
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "folke/neodev.nvim",
            "stevearc/aerial.nvim",
            "theHamsta/nvim-semantic-tokens",
        },
        config = function(_, _)
            local servers = {
                "asm_lsp",
                "bashls",
                "clangd",
                "gradle_ls",
                "groovyls",
                --"ccls",
                "omnisharp",
                "cmake",
                "cssls",
                "gopls",
                "html",
                "rust_analyzer",
                "ltex",
                "marksman",
                "pyright",
                "taplo",
                "tsserver",
                "sumneko_lua",
            }

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            capabilities.workspace = { semanticTokens = { refreshSupport = true } }
            --capabilities['workspace']['semanticTokens'] = { refreshSupport = true }

            for _, lsp in pairs(servers) do
                if lsp == "clangd" then
                    -- handled in clangd_extensions setup
                elseif lsp == "rust_analyzer" then
                    require("lspconfig")[lsp].setup {
                        capabilities = capabilities,
                        on_attach = LSP_ON_ATTACH,
                        flags = {
                            debounce_text_changes = 150,
                        },
                        settings = {
                            ["rust_analyzer"] = {
                                checkOnSave = {
                                    comamnd = "clippy"
                                },
                            },
                        },
                    }
                elseif lsp == "sumneko_lua" then
                    require("lspconfig")[lsp].setup {
                        capabilities = capabilities,
                        runtime_path = true,
                        lspconfig = {
                            on_attach = LSP_ON_ATTACH,
                            flags = {
                                debounce_text_changes = 150,
                            },
                        }
                    }
                elseif lsp == "ltex" then
                    require("lspconfig").ltex.setup {
                        capabilities = capabilities,
                        on_attach = function(client, buffer_num)
                            LSP_ON_ATTACH(client, buffer_num)
                            require("ltex_extra").setup {
                                load_langs = { "en-US" },
                                init_check = true,
                                --path = vim.fn.stdpath("data") ..
                                --    PATH_SEP() ..
                                --    "ltex" .. PATH_SEP() .. "en-US" .. PATH_SEP(),
                                path = ".ltex",
                                log_level = "none",
                            }
                        end,
                        flags = {
                            debounce_text_changes = 150,
                        },
                        filetypes = {
                            "tex", "ltex", "latex", "markdown", "plaintex"
                        },
                        settings = {
                            ltex = {
                                language = "en-US"
                            }
                        }
                    }
                else
                    require("lspconfig")[lsp].setup {
                        capabilities = capabilities,
                        on_attach = LSP_ON_ATTACH,
                        flags = {
                            debounce_text_changes = 150,
                        },
                    }
                end
            end

            map.nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Defintion")
            map.nmap("gc", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration")
            map.nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation")
            map.nmap("<C-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", "Open Documentation Hover")
            map.nmap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
            map.nmap("<C-A-l>", "<cmd>lua vim.lsp.buf.format {async = true}<CR>", "Format Document")
        end,
    },
    {
        "SmiteshP/nvim-navic", -- done, lsp
        lazy = true,
        dependencies = "neovim/nvim-lspconfig",
    },
    {
        "barreiroleo/ltex-extra.nvim",
        lazy = true,
        ft = {
            "*.ltex",
            "*.tex",
            "*.rst",
            "*.latex",
            "*.md",
        },
        dependencies = "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "asm_lsp",
                "bashls",
                --"ccls",
                "clangd",
                "gradle_ls",
                --"groovyls",
                "omnisharp",
                "cmake",
                "cssls",
                "gopls",
                "html",
                "rust_analyzer",
                "ltex",
                "jdtls",
                "marksman",
                "pyright",
                "sumneko_lua",
                "taplo",
                "tsserver",
            }
        },
    },
    {
        "theHamsta/nvim-semantic-tokens",
        lazy = false,
        config = function(_, _)
            local function get_highlighters()
                local highlighters = require("nvim-semantic-tokens.table-highlighter")
                highlighters.token_map["annotation"] = "LspAnnotation"
                highlighters.token_map["attribute"] = "LspAttribute"
                highlighters.token_map["derive"] = "LspDerive"
                highlighters.token_map["concept"] = "LspConcept"
                highlighters.token_map["trait"] = "LspTrait"
                highlighters.token_map["typeAlias"] = "LspTypeAlias"
                highlighters.token_map["constructor"] = "LspConstructor"
                highlighters.token_map["union"] = "LspUnion"
                highlighters.token_map["typedef"] = "LspTypedef"
                highlighters.token_map["boolean"] = "LspBoolean"
                highlighters.token_map["character"] = "LspCharacter"
                highlighters.token_map["escapeSequence"] = "LspEscapeSequence"
                highlighters.token_map["formatSpecifier"] = "LspFormatSpecifier"
                highlighters.token_map["arithmetic"] = "LspArithmetic"
                highlighters.token_map["bitwise"] = "LspBitwise"
                highlighters.token_map["comparison"] = "LspBitwise"
                highlighters.token_map["logical"] = "LspLogical"
                highlighters.token_map["punctuation"] = "LspPunctuation"
                highlighters.token_map["attributeBracket"] = "LspAttributeBracket"
                highlighters.token_map["angle"] = "LspAngle"
                highlighters.token_map["brace"] = "LspBrace"
                highlighters.token_map["bracket"] = "LspBracket"
                highlighters.token_map["parenthesis"] = "LspParenthesis"
                highlighters.token_map["colon"] = "LspColon"
                highlighters.token_map["comma"] = "LspComma"
                highlighters.token_map["semi"] = "LspSemi"
                highlighters.token_map["builtinAttribute"] = "LspBuiltinAttribute"
                highlighters.token_map["builtinType"] = "LspBuiltinType"
                highlighters.token_map["builtinFunction"] = "LspBuiltinFunction"
                highlighters.token_map["builtinVariable"] = "LspBuiltinVariable"
                highlighters.token_map["builtin"] = "LspBuiltin"
                highlighters.token_map["label"] = "LspLabel"
                highlighters.token_map["parameterReference"] = "LspParameterReference"
                highlighters.token_map["parameter"] = "LspParameter"
                highlighters.token_map["field"] = "LspField"
                highlighters.token_map["member"] = "LspMember"
                highlighters.token_map["structMember"] = "LspStructMember"
                highlighters.token_map["staticProperty"] = "LspStaticProperty"
                highlighters.token_map["selfKeyword"] = "LspSelfKeyword"
                highlighters.token_map["thisKeyword"] = "LspThisKeyword"
                highlighters.modifiers_map["static"] = {
                    field = "LspStaticField",
                    property = "LspStaticProperty",
                    variable = "LspStaticVariable"
                }
                highlighters.modifiers_map["classScope"] = {
                    variable = "LspStaticProperty"
                }
                highlighters.modifiers_map["functionScope"] = {
                    declaration = {
                        parameter = "LspParameter"
                    },
                    parameter = "LspParameterReference"
                }
                highlighters.modifiers_map["declaration"] = {
                    parameter = "LspParameter"
                }

                highlighters.reset()

                return highlighters
            end

            require("nvim-semantic-tokens").setup({
                preset = "default",
                highlighters = { get_highlighters() }
            })

            vim.lsp.handlers["workspace/semanticTokens/refresh"] = vim.lsp.with(
                require("nvim-semantic-tokens.semantic_tokens").on_refresh,
                {}
            )

            get_highlighters()
        end
    },
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
        ft = {
            "*.c,",
            "*.cpp",
            "*.cxx",
            "*.cppm",
            "*.h",
            "*.hpp",
            "*.hxx",
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "theHamsta/nvim-semantic-tokens",
        },
        config = function(_, _)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            capabilities.workspace = { semanticTokens = { refreshSupport = true } }
            --capabilities['workspace']['semanticTokens'] = { refreshSupport = true }

            require("clangd_extensions").setup {
                server = {
                    capabilities = capabilities,
                    on_attach = LSP_ON_ATTACH,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--suggest-missing-includes",
                        "--enable-config"
                    },
                },
                extensions = {
                    inlay_hints = {
                        parameter_hints_prefix = "fn : ",
                        other_hints_prefix = "-> "
                    }
                }
            }
        end
    },
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
        ft = {
            "*.java",
            "*.kt"
        },
        dependencies = "neovim/nvim-lspconfig",
    },

}
