LSP_ON_ATTACH = function(client, buffer_num)
    vim.api.nvim_buf_set_option(buffer_num, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local capabilities = client.server_capabilities

    if capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, buffer_num)
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
        "p00f/clangd_extensions.nvim",
        lazy = false,
        ft = {
            "c",
            "cpp",
            "cxx",
            "cppm",
            "h",
            "hpp",
            "hxx",
        },
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function(_, _)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            capabilities.workspace = { semanticTokens = { refreshSupport = true } }

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
