local map = require("map")
return {
    {
        "voldikss/vim-translator",
        lazy = true,
        cmd = {
            "Translate",
            "TranslateW",
        },
        keys = {
            "<leader>tl"
        },
        config = function(_, _)
            vim.g.translator_target_lang = "en"

            map.nmap("<leader>tl", "<cmd>TranslateW<CR>", "translate text")
            map.vmap("<leader>tl", "<cmd>TranslateW<CR>", "translate text")
        end
    },
    {
        "stevearc/overseer.nvim",
        lazy = true,
        cmd = {
            "OverseerRun",
            "OverseerToggle",
        },
        keys = {
            "<leader>os",
        },
        config = function(_, _)
            require("overseer").setup {
                strategy = "jobstart",
                form = {
                    border = require("ui.border").with_hl_group,
                    win_opts = {
                        winblend = 0,
                    },
                },
                confirm = {
                    border = require("ui.border").with_hl_group,
                    win_opts = {
                        winblend = 0,
                    },
                },
                task_win = {
                    border = require("ui.border").with_hl_group,
                    win_opts = {
                        winblend = 0,
                    },
                },
                templates = {
                    "builtin",
                    "user.cmake",
                    "user.xmake",
                },
            }
            map.nmap("<leader>os", "<cmd>OverseerRun<CR>", "Run CMake build")
        end
    },
    --{
    --    "uga-rosa/translate.nvim",
    --    lazy = false,
    --    cmd = {
    --        "Translate"
    --    },
    --    --opts = {
    --    --},
    --},
    {
        "vim-scripts/DoxygenToolkit.vim",
        lazy = true,
        keys = "<S-d>",
        ft = {
            "c",
            "cpp",
            "cxx",
            "cppm",
            "h",
            "hpp",
            "hxx",
        },
        config = function(_, _)
            map.nmap("<S-d>", "<cmd>Dox<CR>", "Create a Doxygen Comment")
        end
    },
    {
        "octol/vim-cpp-enhanced-highlight",
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
    },
    {
        "bfrg/vim-cpp-modern",
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
    },
    {
        "leafgarland/typescript-vim",
        lazy = true,
        ft = {
            "ts",
            "typescript",
        },
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "phaazon/hop.nvim",
        name = "hop",
        lazy = true,
        event = "VeryLazy",
        opts = {
            teasing = false,
            jump_on_sole_occurrence = false,
            case_insensitive = false,
        },
    },
    {
        "tpope/vim-fugitive",
        lazy = true,
        cmd = {
            "Git",
            "G",
            "Gedit",
            "Gsplit",
            "Gdiffsplit",
            "Gvdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "Glgrep",
            "GMove",
            "GRename",
            "GDelete",
            "GRemove",
            "GBrowse",
        },
    },
    {
        "HerringtonDarkholme/yats.vim",
        lazy = true,
        ft = {
            "ts",
            "typescript",
        },
    },
    {
        "cespare/vim-toml",
        lazy = true,
        ft = {
            "toml",
        },
    },
    {
        "numToStr/Comment.nvim",
        lazy = true,
        keys = {
            "<leader>lc",
            "<leader>bc",
            "<leader>Lc",
            "<leader>Bc",
            "<leader>lcO",
            "<leader>lco",
            "<leader>lce",
        },
        opts = {
            padding = true,
            sticky = true,
            toggler = {
                line = "<leader>lc",
                block = "<leader>bc",
            },
            opleader = {
                line = "<leader>Lc",
                block = "<leader>Bc",
            },
            extra = {
                above = "<leader>lcO",
                below = "<leader>lco",
                eol = "<leader>lce"
            }
        },
    },
    {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "VeryLazy",
        config = function(_, _)
            require("nvim-autopairs").setup {
                enable_check_bracket_line = false,
            }
        end,
    },
    {
        "mason-org/mason.nvim",
        lazy = true,
        event = "VeryLazy",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        priority = 10000,
        -- opts = {
        --     ensure_installed = {
        --         "bash",
        --         "c",
        --         "cmake",
        --         "comment",
        --         "cpp",
        --         "c_sharp",
        --         "css",
        --         "cuda",
        --         "d",
        --         "gdscript",
        --         "glsl",
        --         "go",
        --         "hjson",
        --         "html",
        --         "java",
        --         "javascript",
        --         "json",
        --         "json5",
        --         "jsonc",
        --         "kotlin",
        --         "lua",
        --         "markdown",
        --         "markdown_inline",
        --         "php",
        --         "python",
        --         "regex",
        --         "rust",
        --         "scss",
        --         "sql",
        --         "toml",
        --         "typescript",
        --         "tsx",
        --         "vim",
        --         "yaml",
        --         "zig",
        --     },
        --     highlight = {
        --         enable = true,
        --         additional_vim_regex_highlighting = true,
        --     },
        -- },
    },
    {
        "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
        lazy = true,
        submodules = false,
        ft = {
            "bash",
            "cmake",
            "comment",
            "c_sharp",
            "css",
            "cuda",
            "d",
            "gdscript",
            "glsl",
            "go",
            "hjson",
            "html",
            "java",
            "javascript",
            "javascriptreact",
            "json",
            "json5",
            "jsonc",
            "kotlin",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "regex",
            "sass",
            "scss",
            "sql",
            "toml",
            "typescript",
            "typescriptreact",
            "vim",
            "yaml",
        },
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function(_, _)
            require("rainbow-delimiters.setup").setup {
                query = {
                    javascript = "rainbow-parens",
                    jsx = "rainbow-parens",
                    typescript = "rainbow-parens",
                    typescriptreact = "rainbow-parens",
                    tsx = "rainbow-parens",
                },
                highlight = {
                    "RainbowDelimiterNormal",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterCyan",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterBlue",
                }

            }
            vim.cmd("hi! link RainbowDelimiterNormal Normal")
        end
    },
}
