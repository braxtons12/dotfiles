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
        "neovim/nvim-lspconfig",
        lazy = true,
        ft = {
            "asm",
            "bash",
            "c",
            "cmake",
            "cpp",
            "c_sharp",
            "go",
            "groovy",
            "h",
            "html",
            "java",
            "javascript",
            "latex",
            "ltex",
            "lua",
            "markdown",
            "md",
            "python",
            "py",
            "rs",
            "rust",
            "sh",
            "zsh",
            "bash",
            "tex",
            "typescript",
            "ts",
        },
        dependencies = {
            {
                "folke/neodev.nvim",
                lazy = true,
                priority = 1000,
                ft = "lua",
                opts = {
                    library = {
                        plugins = {
                            "nvim-dap-ui",
                        },
                        types = true
                    },
                },
            },
            "williamboman/mason-lspconfig.nvim",
        },
        config = function(_, _)
            local servers = {
                "asm_lsp",
                "bashls",
                "clangd",
                "gradle_ls",
                --"groovyls",
                --"ccls",
                "omnisharp",
                "cmake",
                "cssls",
                --"gopls",
                "html",
                "lua_ls",
                "rust_analyzer",
                "ltex",
                "marksman",
                "pyright",
                "taplo",
                "tsserver",
            }

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = { "utf-16" }

            for _, lsp in pairs(servers) do
                if lsp == "clangd" then
                    -- handled in clangd_extensions setup
                    require("clangd_extensions")
                elseif lsp == "rust_analyzer" then
                    -- handled in rust_tools setup
                elseif lsp == "lua_ls" then
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
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        ft = {
            "asm",
            "bash",
            "c",
            "cmake",
            "cpp",
            "c_sharp",
            "go",
            "groovy",
            "h",
            "html",
            "java",
            "javascript",
            "latex",
            "ltex",
            "lua",
            "markdown",
            "md",
            "python",
            "py",
            "rs",
            "rust",
            "sh",
            "zsh",
            "bash",
            "tex",
            "typescript",
            "ts",
        },
        dependencies = "nvim-lua/plenary.nvim",
        config = function(_, _)
            local null_ls = require("null-ls")
            local helpers = require("null-ls.helpers")
            local methods = require("null-ls.methods")
            local function deep_copy(orig)
                local orig_type = type(orig)
                local copy
                if orig_type == 'table' then
                    copy = {}
                    for orig_key, orig_value in next, orig, nil do
                        copy[deep_copy(orig_key)] = deep_copy(orig_value)
                    end
                    setmetatable(copy, deep_copy(getmetatable(orig)))
                else -- number, string, boolean, etc
                    copy = orig
                end
                return copy
            end
            local base_source = {
                filetypes = {
                    "c",
                    "cpp",
                },
                method = methods.internal.DIAGNOSTICS_ON_SAVE,
                async = true,
            }
            local base_pattern = {
                pattern = [[^([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]],
                groups = {
                    "file",
                    "row",
                    "col",
                    "severity",
                    "message"
                },
                overrides = {
                    severities = {
                        ["fatal error"] = helpers.diagnostics.severities.error,
                        ["error"] = helpers.diagnostics.severities.error,
                        ["note"] = helpers.diagnostics.severities.information,
                        ["warning"] = helpers.diagnostics.severities.warning,
                    },
                }
            }
            local base_generator = {
                to_stdin = false,
                from_stderr = true,
                format = "line",
                timeout = 60000,
                on_output = helpers.diagnostics.from_pattern(base_pattern.pattern,
                    base_pattern.groups,
                    base_pattern.overrides),
            }
            local xmake = deep_copy(base_source)
            xmake.name = "xmake"
            local xmake_generator = deep_copy(base_generator)
            xmake_generator.command = "xmake"
            xmake_generator.args = {
                "b",
            }
            xmake_generator.env = {
                ["XMAKE_COLORTERM"] = "nocolor",
            }
            xmake_generator.runtime_condition = function(_)
                local has_xmake = io.open("xmake.lua")
                if has_xmake then
                    io.close(has_xmake)
                    return true
                end

                return false
            end
            local initial_pattern = deep_copy(base_pattern)
            initial_pattern.pattern = [[^error: ([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]]

            xmake_generator.on_output = helpers.diagnostics.from_patterns(
                {
                    initial_pattern,
                    base_pattern,
                }
            )
            xmake.generator = helpers.generator_factory(xmake_generator)

            local cmake = deep_copy(base_source)
            cmake.name = "cmake"
            local cmake_generator = deep_copy(base_generator)
            cmake_generator.command = "cmake"
            cmake_generator.args = {
                "--build",
                "build",
            }
            cmake_generator.runtime_condition = function(_)
                local has_xmake = io.open("xmake.lua")
                if has_xmake then
                    io.close(has_xmake)
                    return false
                end

                local has_cmake = io.open("CMakeLists.txt")
                if has_cmake then
                    io.close(has_cmake)
                    return true
                end

                return false
            end
            cmake.generator = helpers.generator_factory(cmake_generator)

            require("null-ls").setup {
                on_attach = LSP_ON_ATTACH,
                debounce = 5000,
                default_timeout = 10000,
                on_init = function(client, _)
                    client.offset_encoding = "utf-16"
                end,
                sources = {
                    null_ls.builtins.diagnostics.cppcheck.with {
                        filetypes = {
                            "c",
                            "cpp",
                        },
                        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                        command = "cppcheck",
                        -- cmake compile_commands.json files tend to freak cppcheck out,
                        -- so only use compile_commands.json generated from xmake
                        runtime_condition = function(_)
                            local has_xmake = io.open("xmake.lua")
                            if has_xmake then
                                io.close(has_xmake)
                                return true
                            end

                            return false
                        end,
                        args = {
                            "--enable=all",
                            "--suppress=missingIncludeSystem",
                            "--suppress=preprocessorErrorDirective",
                            "--suppress=unmatchedSuppression",
                            "--project=compile_commands.json",
                            "$FILENAME",
                        },
                    },
                    null_ls.builtins.code_actions.gitsigns.with {
                        config = {
                            filter_actions = function(title)
                                return title:lower():match("blame") == nil
                            end
                        },
                    },
                    null_ls.builtins.code_actions.cspell,
                    null_ls.builtins.diagnostics.cspell,
                    xmake,
                    cmake,
                },
                border = require("ui.border").with_hl_group,
                diagnostics_format = "#{m}"
            }

            require("null-ls").disable({ name = "cmake" })
            require("null-ls").disable({ name = "xmake" })
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
            "ltex",
            "tex",
            "rst",
            "restructured-text",
            "latex",
            "md",
            "markdown",
        },
        dependencies = "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {
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
                --"gopls",
                "html",
                "lua_ls",
                "rust_analyzer",
                "ltex",
                "jdtls",
                "marksman",
                "pyright",
                "taplo",
                "tsserver",
            }
        },
    },
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
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
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = { "utf-16" }

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
                        "--clang-tidy",
                        "--all-scopes-completion",
                        "--completion-style=detailed",
                        "--header-insertion=iwyu",
                        "--header-insertion-decorators",
                        "--pch-storage=memory",
                        --"--suggest-missing-includes",
                        "--enable-config"
                    },
                },
                extensions = {
                    autoSetHints = true,
                    inlay_hints = {
                        inline = true,
                        only_current_line = false,
                        show_parameter_hints = true,
                        parameter_hints_prefix = "fn : ",
                        other_hints_prefix = "-> "
                    }
                },
            }
        end
    },
    {
        "simrat39/rust-tools.nvim",
        lazy = true,
        ft = {
            "rust",
            "toml",
            "cargo"
        },
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function(_, _)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = { "utf-16" }
            require("rust-tools").setup {
                tools = {
                    inlay_hints = {
                        other_hints_prefix = "-> "
                    },
                    hover_actions = {
                        border = require("ui.border").with_hl_group,
                        auto_focus = true,
                    },
                },
                server = {
                    capabilities = capabilities,
                    on_attach = LSP_ON_ATTACH,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = true,
                            check = {
                                command = "clippy",
                                features = "all",
                            },
                            cargo = {
                                features = "all",
                                buildScripts = {
                                    enable = true,
                                },
                            },
                            workspace = {
                                symbol = {
                                    search = {
                                        kind = "all_symbols",
                                    },
                                },
                            },
                            diagnostics = {
                                experimental = {
                                    enable = true,
                                },
                            },
                        },
                    },
                }
            }

            vim.cmd("hi! link @enumMember @enum")
            vim.cmd("hi clear @attribute")
            vim.cmd("hi! link @decorator Macro")
            vim.cmd("hi! link @attributeBracket Normal")
            vim.cmd("hi! link @derive Type")
            vim.cmd("hi! link @deriveHelper Macro")
            vim.cmd("hi! link @generic Type")
            vim.cmd("hi! link @crateRoot Namespace")

            map.nmap("<A-k>",
                "<cmd>lua require(\"rust-tools\").hover_actions.hover_actions()<CR>",
                "Rust hover actions")
        end,
    },
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
        ft = {
            "java",
            "kotlin"
        },
        dependencies = "neovim/nvim-lspconfig",
    },

}
