LSP_ON_ATTACH = function(client, buffer_num)
    vim.api.nvim_buf_set_option(buffer_num, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local capabilities = client.server_capabilities

    if capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, buffer_num)
    end

    if capabilities.inlayHintProvider then
        vim.g.inlay_hints_visible = true
        vim.lsp.inlay_hint.enable(true)
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
            "cargo",
            "cmake",
            "cpp",
            "css",
            "c_sharp",
            "go",
            "groovy",
            "h",
            "html",
            "java",
            "javascript",
            "javascriptreact",
            "json",
            "latex",
            "ltex",
            "lua",
            "md",
            "markdown",
            "php",
            "py",
            "python",
            "rs",
            "rust",
            "sass",
            "scss",
            "sh",
            "tex",
            "toml",
            "ts",
            "typescript",
            "typescriptreact",
            "yml",
            "yaml",
            "zsh",
        },
        dependencies = {
            {
                "folke/lazydev.nvim",
                lazy = true,
                priority = 1000,
                ft = "lua",
                opts = {
                    library = {
                        plugins = {
                            "nvim-dap-ui",
                        },
                    },
                },
            },
        },
        opts = {
            inlay_hints = { enabled = true, },
        },
        config = function(_, _)
            local servers = {
                "asm_lsp",
                "bashls",
                --"ccls",
                "clangd",
                "cmake",
                "cssls",
                "eslint",
                --"gopls",
                "gradle_ls",
                --"groovyls",
                "html",
                "jsonls",
                "ltex",
                "lua_ls",
                "marksman",
                "omnisharp",
                "phpactor",
                "pyright",
                "psalm",
                "rust_analyzer",
                "taplo",
                -- handled in typescript-tools.nvim
                --"ts_ls",
                "yamlls",
            }

            --local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- capabilities.offsetEncoding = { "utf-16" }
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            --capabilities.offsetEncoding = { "utf-16" }

            for _, lsp in pairs(servers) do
                if lsp == "clangd" then
                    -- handled in clangd_extensions setup
                    vim.lsp.config(lsp, {
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
                            "--suggest-missing-includes",
                            "--enable-config"
                        },
                    })
                    require("clangd_extensions")
                elseif lsp == "rust_analyzer" then
                    -- handled in rust_tools setup
                elseif lsp == "lua_ls" then
                    vim.lsp.config(lsp, {
                        capabilities = capabilities,
                        runtime_path = true,
                        lspconfig = {
                            on_attach = LSP_ON_ATTACH,
                            flags = {
                                debounce_text_changes = 150,
                            },
                        }
                    })
                elseif lsp == "ltex" then
                    vim.lsp.config(lsp, {
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
                    })
                elseif lsp == "phpactor" then
                    vim.lsp.config(lsp, {
                        capabilities = capabilities,
                        on_attach = LSP_ON_ATTACH,
                        flags = {
                            debounce_text_changes = 150,
                        },
                        init_options = {
                            ["language_server_psalm.enabled"] = true,
                            ["language_server_phpstan.enabled"] = true,
                            ["indexer.enabled_watchers"] = { "watchman", },
                        },
                        settings = {
                            [lsp] = {
                                indexer = {
                                    enabled_watchers = {
                                        "watchman",
                                    },
                                },
                            }
                        },
                    })
                else
                    vim.lsp.config(lsp, {
                        capabilities = capabilities,
                        on_attach = LSP_ON_ATTACH,
                        flags = {
                            debounce_text_changes = 150,
                        },
                    })
                end
            end

            local picker_settings = {
                focus = "list",
                win = {
                    list = {
                        keys = {
                            ["<Esc>"] = "cancel",
                        },
                    },
                },
            }

            local defs = function()
                require("snacks").picker.lsp_definitions((picker_settings))
            end
            local decls = function()
                require("snacks").picker.lsp_declarations((picker_settings))
            end
            local impls = function()
                require("snacks").picker.lsp_implementations((picker_settings))
            end
            local refs = function()
                require("snacks").picker.lsp_references((picker_settings))
            end

            map.nmap("gd", defs, "Go to Defintion")
            map.nmap("gc", decls, "Go to Declaration")
            map.nmap("gi", impls, "Go to Implementation")
            map.nmap("ref", refs, "References")
            map.nmap("gr", refs, "References")
            map.nmap("<C-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", "Open Documentation Hover")
            map.nmap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
            map.nmap("<C-A-l>", "<cmd>lua vim.lsp.buf.format {async = true}<CR>", "Format Document")
        end,
    },
    {
        "https://gitlab.com/schrieveslaach/sonarlint.nvim",
        lazy = true,
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        ft = {
            "c",
            "cpp",
            "csharp",
            "css",
            "html",
            "java",
            "javascript",
            "javascriptreact",
            "jsx",
            "php",
            "python",
            "tsx",
            "typescript",
            "typescriptreact",
        },
        config = function(_, _)
            require("sonarlint").setup {
                server = {
                    cmd = {
                        "sonarlint-language-server",
                        "-stdio",
                        "-analyzers",
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarhtml.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarlintomnisharp.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarphp.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
                    },
                    settings = {
                        sonarlint = {
                            rules = {
                                ["cpp:S125"] = { level = "off" },
                                ["cpp:S954"] = { level = "off" },
                                ["php:S100"] = { level = "off" },
                                ["php:S116"] = { level = "off" },
                                ["php:S1142"] = { level = "off" },
                                ["php:S1448"] = { level = "off" },
                            }
                        }
                    }
                },
                filetypes = {
                    "c",
                    "cpp",
                    "csharp",
                    "css",
                    "html",
                    "java",
                    "javascript",
                    "javascriptreact",
                    "jsx",
                    "php",
                    "python",
                    "tsx",
                    "typescript",
                    "typescriptreact",
                },
            }
        end,
    },
    {
        "pmizio/typescript-tools.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig"
        },
        ft = {
            "css",
            "scss",
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
        },
        config = function(_, _)
            require("typescript-tools").setup {
                on_attach = LSP_ON_ATTACH,
                settings = {
                    complete_fuctions_calls = true,
                    publish_diagnostics_on = "change",
                    expose_as_code_actions = "all",
                    jsx_close_tag = {
                        enable = true,
                    }
                },
            }
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        enabled = false,
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
                default_timeout = 2000,
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
                    --null_ls.builtins.code_actions.cspell.with {
                    --    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                    --},
                    --null_ls.builtins.diagnostics.cspell.with {
                    --    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                    --},
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
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
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
                "eslint",
                --"gopls",
                "html",
                "lua_ls",
                "rust_analyzer",
                "ltex",
                "jdtls",
                "jsonls",
                "marksman",
                "omnisharp",
                "phpactor",
                "pyright",
                "taplo",
                "ts_ls",
                "yamlls",
            }
        },
    },
    {
        "https://git.sr.ht/~p00f/clangd_extensions.nvim",
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
    },
    {
        "mrcjkb/rustaceanvim",
        lazy = true,
        ft = {
            "rust",
            "toml",
            "cargo",
        },
        config = function(_, _)
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local capabilities = require("rustaceanvim.config.server").create_client_capabilities()
            capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
            capabilities.experimental.offsetEncoding = {"utf-16"}

            local ra_bin = vim.fn.stdpath("data")
                        .. map.path_separator() .. "mason" .. map.path_separator() .. "bin"
                        .. map.path_separator() .. "rust-analyzer"

            vim.g.rustaceanvim = {
                tools = {
                    hover_actions = {
                        replace_builtin_hover = true,
                    },
                    float_win_config = {
                        border = require("ui.border").with_hl_group
                    },
                    enable_clippy = true,
                    cargo_override = "cargo",
                },
                server = {
                    cmd = { ra_bin },
                    capabilities = capabilities,
                    on_attach = LSP_ON_ATTACH,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    status_notify_level = 'error',
                    default_settings = {
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
                                autoreload = true,
                            },
                            procMacro = {
                                enable = true,
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

            local picker_settings = {
                focus = "list",
                win = {
                    list = {
                        keys = {
                            ["<Esc>"] = "cancel",
                        },
                    },
                },
            }

            local defs = function()
                require("snacks").picker.lsp_definitions((picker_settings))
            end
            local decls = function()
                require("snacks").picker.lsp_declarations((picker_settings))
            end
            local impls = function()
                require("snacks").picker.lsp_implementations((picker_settings))
            end
            local refs = function()
                require("snacks").picker.lsp_references((picker_settings))
            end

            map.nmap("gd", defs, "Go to Defintion")
            map.nmap("gc", decls, "Go to Declaration")
            map.nmap("gi", impls, "Go to Implementation")
            map.nmap("ref", refs, "References")
            map.nmap("gr", refs, "References")
            map.nmap("<C-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", "Open Documentation Hover")
            map.nmap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
            map.nmap("<C-A-l>", "<cmd>lua vim.lsp.buf.format {async = true}<CR>", "Format Document")
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
