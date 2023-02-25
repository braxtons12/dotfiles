local map = require("map")
return {
    {
        "tpope/vim-dispatch",
        lazy = true,
        cmd = {
            "Make",
            "Dispatch",
            "FocusDispatch",
            "Focus",
        },
        keys = {
            "<leader>cm",
            "<leader>xm",
        },
        config = function(_, _)
            RUN_CMAKE = function()
                vim.cmd([[set errorformat=%E%f:%l:%c:\ %trror:\ %m,%-Z%p^,%+C%.%#]])
                vim.cmd([[set errorformat+=%D%*\\a:\ Entering\ directory\ '%f']])
                vim.cmd([[set errorformat+=%X%*\\a:\ Leaving\ directory\ '%f']])
                vim.cmd([[set errorformat+=%-G%.%#]])
                vim.o.makeprg = "cmake --build build"
                vim.cmd("Make")
            end
            RUN_XMAKE = function()
                vim.cmd([[set errorformat=%E%f:%l:%c:\ %trror:\ %m,%-Z%p^,%+C%.%#]])
                vim.cmd([[set errorformat+=%D%*\\a:\ Entering\ directory\ '%f']])
                vim.cmd([[set errorformat+=%X%*\\a:\ Leaving\ directory\ '%f']])
                vim.cmd([[set errorformat+=%-G%.%#]])
                vim.o.makeprg = "xmake b"
                vim.cmd("Make")
            end
            map.nmap("<leader>cm", "<cmd>lua RUN_CMAKE()<CR>", "Run CMake build")
            map.nmap("<leader>xm", "<cmd>lua RUN_XMAKE()<CR>", "Run CMake build")
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
        opts = {
            teasing = false,
            jump_on_sole_occurrence = false,
            case_insensitive = false,
        },
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
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
        lazy = false,
        config = function(_, _)
            require("nvim-autopairs").setup {}
        end,
    },
    {
        "williamboman/mason.nvim",
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
                "python",
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
