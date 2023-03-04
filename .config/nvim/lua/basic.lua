local map = require("map")
return {
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
        "famiu/bufdelete.nvim",
        lazy = true,
        keys = "<C-c>",
        config = function(_, _)
            map.nmap("<C-c>", "<cmd>Bdelete<CR>", "Delete current buffer")
        end
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
            require("nvim-autopairs").setup {}
        end,
    },
    {
        "williamboman/mason.nvim",
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
        lazy = true,
        ft = {
            "bash",
            "c",
            "cmake",
            "comment",
            "cpp",
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
            "json",
            "json5",
            "jsonc",
            "kotlin",
            "lua",
            "markdown",
            "python",
            "rust",
            "toml",
            "typescript",
            "vim",
            "yaml",
            "zig",
        },
        cmd = "TSUpdate",
        priority = 10000,
        config = function(_, options)
            require("nvim-treesitter.configs").setup(options)
        end,
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "comment",
                "cpp",
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
                "json",
                "json5",
                "jsonc",
                "kotlin",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "rust",
                "toml",
                "typescript",
                "vim",
                "yaml",
                "zig",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
        },
    },
    {
        "nvim-treesitter/playground",
        lazy = true,
        keys = "<F10>",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function(_, options)
            require("nvim-treesitter.configs").setup(options)
            map.nmap("<F10>",
                "<cmd>TSHighlightCapturesUnderCursor<CR>",
                "Show Highlight Group For Token")
        end,

        opts = {
            playground = {
                enabled = true,
                disable = {},
                updatetime = 25,
                persist_queries = false,
                keybindings = {},
            }
        },
    },
}
