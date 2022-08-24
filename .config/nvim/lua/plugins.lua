----------------------------------------------
-- PLUGINS IN USE
----------------------------------------------
local packer = require('packer')
packer.use "vim-scripts/DoxygenToolkit.vim"
packer.use "kyazdani42/nvim-web-devicons"
packer.use "leafgarland/typescript-vim"
packer.use "vim-autoformat/vim-autoformat"
packer.use { "phaazon/hop.nvim",
    config = function()
        require("hop").setup {
            teasing = false,
            jump_on_sole_occurrence = false,
            case_insensitive = false,
        }
    end
}
packer.use "tpope/vim-fugitive"
--packer.use { "/home/braxton/git/blame_line.nvim",
--    as = "blame_line.nvim",
--    config = function()
--    	require("blame_line").setup {
--    	}
--    end
--}
packer.use "cespare/vim-toml"
packer.use "HerringtonDarkholme/yats.vim"
packer.use { "gfeiyou/command-center.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("telescope").load_extension("command_center")
    end
}
-- for mouse draggable scrollbar
packer.use { "dstein64/nvim-scrollview",
    branch = "main",
    config = function()
        require("scrollview").setup {
            scrollview_column = 1,
        }

    end
}
-- for lsp signs in scrollbar
packer.use { "petertriho/nvim-scrollbar",
    config = function()
        require("scrollbar").setup {
            marks = {
                Handler = { color = "#262b33" },
                Search = { color = "#dbba75" },
                Error = { color = "#c65156" },
                Warn = { color = "#d29767" },
                Hint = { color = "#9daaaa" },
                Info = { color = "#61afef" },
                Misc = { color = "#c67ada" },
            },
            autocmd = {
                render = {
                    "BufWinEnter",
                    "TabEnter",
                    "TermEnter",
                    "WinEnter",
                    "CmdwinLeave",
                    "TextChanged",
                    "InsertChange",
                    "VimResized",
                    "WinScrolled",
                    "BufLeave",
                },
            },
        }

        vim.cmd("highlight ScrollbarHandle guibg=#262b33")
        vim.cmd("highlight ScrollbarSearch guibg=#262b33 guifg=#dbba75")
        vim.cmd("highlight ScrollbarError guibg=#262b33 guifg=#c65156")
        vim.cmd("highlight ScrollbarWarn guibg=#262b33 guifg=#d29767")
        vim.cmd("highlight ScrollbarHint guibg=#262b33 guifg=#9daaaa")
        vim.cmd("highlight ScrollbarInfo guibg=#262b33 guifg=#61afef")
        vim.cmd("highlight ScrollbarMisc guibg=#262b33 guifg=#c67ada")
        vim.cmd("highlight ScrollbarSearchHandle guibg=#262b33 guifg=#dbba75")
        vim.cmd("highlight ScrollbarErrorHandle guibg=#262b33 guifg=#c65156")
        vim.cmd("highlight ScrollbarWarnHandle guibg=#262b33 guifg=#d29767")
        vim.cmd("highlight ScrollbarHintHandle guibg=#262b33 guifg=#9daaaa")
        vim.cmd("highlight ScrollbarInfoHandle guibg=#262b33 guifg=#61afef")
        vim.cmd("highlight ScrollbarMiscHandle guibg=#262b33 guifg=#c67ada")
    end
}
packer.use "famiu/bufdelete.nvim"
packer.use { "yamatsum/nvim-cursorline",
    config = function()
        require("nvim-cursorline").setup {
            cursorline = {
                enable = true,
                timeout = 0,
                number = true,
            },
            cursorword = {
                enable = false,
            },
        }
    end
}
packer.use "octol/vim-cpp-enhanced-highlight"
packer.use "bfrg/vim-cpp-modern"
packer.use "rakr/vim-one"
packer.use { "j-hui/fidget.nvim",
    config = function()
        require("fidget").setup {
            done = ""
        }
    end
}

BORDER = {
    { "┏", "FloatBorder" },
    { "━", "FloatBorder" },
    { "┓", "FloatBorder" },
    { "┃", "FloatBorder" },
    { "┛", "FloatBorder" },
    { "━", "FloatBorder" },
    { "┗", "FloatBorder" },
    { "┃", "FloatBorder" },
}

packer.use { "m-demare/hlargs.nvim",
    requires = "nvim-treesitter",
    config = function()
        require("hlargs").setup {
            color = "#6090a4",
            excluded_argnames = {
                declarations = {
                    python = { "self", "cls" },
                    lua = { "self" },
                    rust = { "self" },
                    cpp = { "this", "self" }
                },
                usages = {
                    python = { "self", "cls" },
                    lua = { "self" },
                    rust = { "self" },
                    cpp = { "this", "self" }
                }
            }
        }
    end
}

packer.use { "stevearc/aerial.nvim",
    requires = "nvim-treesitter",
    config = function()
        require("aerial").setup {
            backends = {
                "treesitter",
                "lsp",
                "markdown",
            },
            close_behavior = "global",
            default_bindings = true,
            default_direction = "right",
            filter_kind = {
                "Module",
                "Class",
                "Struct",
                "Interface",
                "Constructor",
                "Method",
                "Enum",
                "Function",
            },
            highlight_mode = "split_width",
            highlight_closest = true,
            highlight_on_hover = true,
            icons = require("lspkind_icons"),
            open_automatic = false,
            max_width = { 30, 0.2 },
            min_width = 20,
            show_guides = true,
            placement_editor_edge = true,
            float = {
                border = BORDER,
                relative = "win",
                max_height = 1.0,
                min_height = { 1.0, 1.0 },
            },
        }
    end
}
packer.use { "declancm/cinnamon.nvim",
    config = function()
        require("cinnamon").setup {
            default_keymaps = true,
            extra_keymaps = false,
            extended_keymaps = true,
            always_scroll = false,
            centered = false,
            default_delay = 0.1,
            horizontal_scroll = true,
            scroll_limit = 50,
        }
    end
}
packer.use { "nvim-treesitter/nvim-treesitter-context",
    requires = "nvim-treesitter",
    config = function()
        require("treesitter-context").setup {
            enable = true,
            max_lines = 4,
            patterns = {
                default = {
                    "class",
                    "function",
                    "method",
                    "for",
                    "while",
                    "if",
                    "switch",
                },
            },
        }
    end
}
packer.use { "lukas-reineke/virt-column.nvim",
    config = function()
        require("virt-column").setup {
        }
    end
}
packer.use { "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    as = "lsp_lines.nvim",
    requires = "nvim-lspconfig",
    config = function()
        require("lsp_lines").setup()
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = {
                prefix = "🔥",
            },
        })
    end
}
packer.use { "CosmicNvim/cosmic-ui",
    requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("cosmic-ui").setup()
    end
}
packer.use { "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            window = {
                border = BORDER,
                margin = { 2, 2, 2, 2 },
                winblend = 1
            },
        }
    end
}
packer.use { "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
        require("alpha").setup(require("alpha.themes.dashboard").config)
    end
}
packer.use { "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
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
        })
    end
}
packer.use { "folke/lua-dev.nvim",
    config = function()
        require("lua-dev").setup({
            runtime_path = true,
        })
    end
}
packer.use { "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        },
    },
    config = function()
        local actions = require("telescope.actions")
        local telescope = require("telescope")
        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ["<S-A-j>"] = actions.move_selection_next,
                        ["<S-A-k>"] = actions.move_selection_previous,
                        ["<S-j>"] = actions.preview_scrolling_down,
                        ["<S-k>"] = actions.preview_scrolling_up,
                    },
                    n = {
                        ["<S-A-j>"] = actions.move_selection_next,
                        ["<S-A-k>"] = actions.move_selection_previous,
                        ["<S-j>"] = actions.preview_scrolling_down,
                        ["<S-k>"] = actions.preview_scrolling_up,
                    },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim" -- add this value
                }
            },
            extensions = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        }
        telescope.load_extension("fzf")
    end
}
packer.use { "tzachar/fuzzy.nvim",
    requires = { "nvim-telescope/telescope-fzf-native.nvim" }
}
packer.use { "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("indent_blankline").setup {
        }
        vim.g.indent_blankline_show_trailing_blankline_indent = false
    end
}
packer.use "Raimondi/delimitMate"
packer.use { "NvChad/nvterm",
    config = function()
        require("nvterm").setup({
            terminals = {
                list = {},
                type_opts = {
                    float = {
                        relative = "editor",
                        row = 0.3,
                        col = 0.25,
                        width = 0.6,
                        height = 0.3,
                        border = BORDER,
                    },
                    horizontal = {
                        location = "below",
                        split_ratio = 0.3,
                    },
                    vertical = {
                        location = "right",
                        split_ratio = 0.5,
                    },
                },
            },
            behavior = {
                close_on_exit = true,
                auto_insert = true,
            },
            toggle = {
                horizontal = "<T>",
                float = "<C-S-t>"
            },
        })
    end
}
packer.use { "nvim-treesitter/nvim-treesitter",
    run = "<cmd>TSUpdate<CR>",
    config = function()
        require("nvim-treesitter.configs").setup {
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
        }
    end
}
packer.use { "nvim-treesitter/playground",
    config = function()
        require("nvim-treesitter.configs").setup {
            playground = {
                enabled = true,
                disable = {},
                updatetime = 25,
                persist_queries = false,
                keybindings = {},
            }
        }
    end
}
packer.use { "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "nightly",
    config = function()
        require("nvim-tree").setup {
            update_focused_file = {
                enable = true,
                update_cwd = false,
            },
            respect_buf_cwd = true,
            view = {
                mappings = {
                    list = {
                        { key = "<C-t>", action = "close", mode = "n" },
                        { key = "e", action = "edit", mode = "n" }
                    }
                }
            },
            renderer = {
                highlight_git = true,
                highlight_opened_files = "all",
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = "└ ",
                        edge = "│ ",
                        --item = "│ ",
                        none = "  ",
                    },
                },
                icons = {
                    webdev_colors = false,
                    git_placement = "before",
                    padding = " ",
                    symlink_arrow = " ➛ ",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "M",
                            staged = "",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = false,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            actions = {
                change_dir = {
                    enable = false,
                },
            },
        }
    end
}
packer.use { "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup {
            current_line_blame = true,
            current_line_blame_formatter = " <author> • <author_time:%R> • <summary>",
            current_line_blame_opts = {
                delay = 0
            }
        }
    end
}
packer.use { "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    after = "nvim-lspconfig",
    config = function()
        require("trouble").setup {
            mode = "document_diagnostics",
            action_keys = {
                close = "<C-l><C-k>",
                cancel = "<esc>",
                refresh = "<C-r>",
                jump = "<CR>",
                open_split = "<C-A-S-h>",
                open_vsplit = "<C-A-S-s>",
                open_tab = "<C-A-S-t>",
                jump_close = "<C-CR>",
                hover = "<C-A-S-k>"
            },
            auto_preview = "false",
            signs = {
                error = " ",
                warning = " ",
                hint = " ",
                information = " "
            },
            use_diagnostic_signs = false,
        }
    end
}
packer.use { "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup {
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                    {
                        filetype = "Outline",
                        text = "",
                        highlight = "Directory",
                        text_align = "right",
                    },
                    {
                        filetype = "aerial",
                        text = "Outline",
                        highlight = "Directory",
                        text_align = "right",
                    },
                },
                right_mouse_command = "",
                ---@diagnostic disable-next-line: assign-type-mismatch
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = true,
                show_buffer_icons = true,
                separator_style = "thick",
                always_show_bufferline = true,
            }
        }
    end
}
packer.use { "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        vim.notify = notify
        notify.setup(
            {
                background_colour = "Normal",
                fps = 30,
                icons = {
                    DEBUG = "",
                    ERROR = "",
                    INFO = "",
                    TRACE = "",
                    WARN = ""
                },
                level = "warn",
                minimum_width = 30,
                max_width = 60,
                render = "default",
                stages = "fade_in_slide_out",
                timeout = 2500,
                on_open = function(win)
                    if vim.api.nvim_win_is_valid(win) then
                        local notify_border = {
                            { "┌", },
                            { "─", },
                            { "┐", },
                            { "│", },
                            { "┘", },
                            { "─", },
                            { "└", },
                            { "│", },
                        }
                        vim.api.nvim_win_set_config(win, { border = notify_border })
                    end

                end,
            })
    end
}
packer.use { "nvim-lualine/lualine.nvim",
    config = function()
        local lualine_theme = {
            normal = {
                a = { fg = "#23272e", bg = "#98c379" },
                b = { fg = "#98c379", bg = "#23272e" },
                c = { fg = "#9daaaa", bg = "#303742" },
                x = { fg = "#9daaaa", bg = "#303742" },
                y = { fg = "#98c379", bg = "#23272e" },
                z = { fg = "#23272e", bg = "#98c379" },
            },
            insert = {
                a = { fg = "#23272e", bg = "#61afef" },
                b = { fg = "#61afef", bg = "#23272e" },
                y = { fg = "#61afef", bg = "#23272e" },
                z = { fg = "#23272e", bg = "#61afef" },
            },
            visual = {
                a = { fg = "#23272e", bg = "#c678dd" },
                b = { fg = "#c678dd", bg = "#23272e" },
                y = { fg = "#c678dd", bg = "#23272e" },
                z = { fg = "#23272e", bg = "#c678dd" },
            },
            replace = {
                a = { fg = "#23272e", bg = "#e06c75" },
                b = { fg = "#e06c75", bg = "#23272e" },
                y = { fg = "#e06c75", bg = "#23272e" },
                z = { fg = "#23272e", bg = "#e06c75" },
            },
            command = {
                a = { fg = "#23272e", bg = "#e06c75" },
                b = { fg = "#e06c75", bg = "#23272e" },
                y = { fg = "#e06c75", bg = "#23272e" },
                z = { fg = "#23272e", bg = "#e06c75" },
            },
        }
        require("lualine").setup {
            options = {
                theme = lualine_theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                always_divide_middle = true,
                globalstatus = true,
            },
            extensions = {
                'quickfix',
                'fugitive',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'filename',
                        file_status = true,
                        path = 1
                    },
                    {
                        '%w',
                        cond = function()
                            return vim.wo.previewwindow
                        end,
                    },
                    {
                        '%r',
                        cond = function()
                            return vim.bo.readonly
                        end,
                    },
                    {
                        '%q',
                        cond = function()
                            return vim.bo.buftype == 'quickfix'
                        end,
                    },
                },
                lualine_c = {},
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        sections = { 'error', 'warn', 'info' },
                        update_in_insert = true,
                        always_visible = true,
                    },
                },
                lualine_y = {
                    {
                        'filetype'
                    },
                    {
                        'encoding'
                    },
                    {
                        'fileformat'
                    },
                },
                lualine_z = {
                    {
                        'location'
                    },
                    {
                        'progress'
                    }
                },
            },
            inactive_sections = {
                lualine_c = { '%f %y %m' },
                lualine_x = {},
            },
        }
    end
}
packer.use { "williamboman/mason.nvim",
    after = "nvim-lspconfig",
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    end,
}
packer.use { "williamboman/mason-lspconfig.nvim",
    after = { "nvim-lspconfig", "mason.nvim" },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "asm_lsp",
                "bashls",
                --"ccls",
                "clangd",
                "omnisharp",
                "cmake",
                "cssls",
                "gopls",
                "html",
                "rust_analyzer",
                "ltex",
                "marksman",
                "pyright",
                "sumneko_lua",
                "taplo",
                "tsserver",
            }
        })
    end,
}
packer.use { "mfussenegger/nvim-dap",
    after = "mason.nvim",
    config = function()
        local path_sep = function()
            return package.config:sub(1, 1)
        end
        local dap = require("dap")
        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = vim.fn.stdpath("data") .. path_sep() .. "mason" .. path_sep() .. "bin"
                    .. path_sep() .. "codelldb",
                args = { "--port", "${port}" },
            },
        }
        dap.configurations.cpp = {
            {
                name = "Debug",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = true,
            }
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
        vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Field" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "Field" })
    end
}

packer.use { "rcarriga/nvim-dap-ui",
    after = "nvim-dap",
    config = function()
        local dapui = require("dapui")
        dapui.setup {
            -- Layouts define sections of the screen to place windows.
            -- The position can be "left", "right", "top" or "bottom".
            -- The size specifies the height/width depending on position. It can be an Int
            -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
            -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
            -- Elements are the elements shown in the layout (in order).
            -- Layouts are opened in order so that earlier layouts take priority in window sizing.
            layouts = {
                {
                    elements = {
                        -- Elements can be strings or table with id and size keys.
                        { id = "stacks", size = 0.2 },
                        { id = "breakpoints", size = 0.2 },
                        --"watches",
                        { id = "scopes", size = 0.6 },
                    },
                    size = 40, -- 40 columns
                    position = "right",
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 0.25, -- 25% of total lines
                    position = "bottom",
                },
            },
        }
        local dap = require("dap")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open {}
            vim.cmd("DapVirtualTextEnable")
            dap.repl.close()
        end
        dap.listeners.before.event_initialized["dapui_config"] = function()
            dapui.close {}
            vim.cmd("DapVirtualTextDisable")
            dap.repl.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            --dapui.close{}
            vim.cmd("DapVirtualTextDisable")
            dap.repl.close()
        end
        dap.listeners.after.event_stopped["dapui_config"] = function()
            dap.repl.close()
        end
        dap.listeners.after.event_output["dapui_config"] = function()
            dap.repl.close()
        end
    end
}
packer.use { "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",
    config = function()
        require("nvim-dap-virtual-text").setup {}
    end
}

packer.use { "theHamsta/nvim-semantic-tokens",
    config = function()
        local highlighters = require("nvim-semantic-tokens.table-highlighter")
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
        highlighters.token_map["field"] = "LspField"
        highlighters.token_map["member"] = "LspMember"
        highlighters.token_map["structMember"] = "LspStructMember"
        highlighters.token_map["staticProperty"] = "LspStaticProperty"
        highlighters.token_map["selfKeyword"] = "LspSelfKeyword"
        highlighters.token_map["thisKeyword"] = "LspThisKeyword"

        highlighters.reset()

        require("nvim-semantic-tokens").setup({
            preset = "default",
            highlighters = { highlighters }
        })

        vim.lsp.handlers["workspace/semanticTokens/refresh"] = vim.lsp.with(
            require("nvim-semantic-tokens.semantic_tokens").on_refresh,
            {}
        )
    end
}

LSP_ON_ATTACH = function(client, buffer_num)
    require("aerial").on_attach(client, buffer_num)
    vim.api.nvim_buf_set_option(buffer_num, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local capabilities = client.server_capabilities
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

packer.use { "p00f/clangd_extensions.nvim",
    after = { "nvim-lspconfig", "nvim-semantic-tokens", },
    config = function()
        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        capabilities['workspace']['semanticTokens'] = { refreshSupport = true }

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
    end,
}
packer.use { "neovim/nvim-lspconfig",
    after = {
        "lua-dev.nvim",
        "aerial.nvim",
        "nvim-semantic-tokens",
    },
    config = function()
        local servers = {
            "asm_lsp",
            "bashls",
            "clangd",
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

        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        capabilities['workspace']['semanticTokens'] = { refreshSupport = true }

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
                local lua_dev = require("lua-dev").setup({
                    capabilities = capabilities,
                    runtime_path = true,
                    lspconfig = {
                        on_attach = LSP_ON_ATTACH,
                        flags = {
                            debounce_text_changes = 150,
                        },
                    },
                })
                require("lspconfig")[lsp].setup(lua_dev)
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
    end
}
packer.use { "hrsh7th/nvim-cmp",
    after = {
        "nvim-lspconfig"
    },
    requires = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-git",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lua",
        {
            "tamago324/cmp-zsh",
            event = {
                "BufRead .zshrc",
                "BufRead *.sh",
                "BufRead .bashrc"
            },
            config = function()
                require("cmp_zsh").setup {
                    zshrc = true,
                }
            end
        },
        { "Saecki/crates.nvim",
            event = { "BufRead Cargo.toml" },
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("crates").setup {
                }
            end
        },
        { "hrsh7th/cmp-vsnip",
            requires = { "hrsh7th/vim-vsnip" },
        },
        {
            "tzachar/cmp-fuzzy-path",
            requires = { "tzachar/fuzzy.nvim" }
        },
    },
    config = function()
        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local feedkey = function(key, mode)
            ---@diagnostic disable-next-line: param-type-mismatch
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
        end

        local cmp = require("cmp")
        local cmp_border = {
            { "┏", "FloatBorder" },
            { "━", "FloatBorder" },
            { "┓", "FloatBorder" },
            { "┃", "FloatBorder" },
            { "┛", "FloatBorder" },
            { "━", "FloatBorder" },
            { "┗", "FloatBorder" },
            { "┃", "FloatBorder" },
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            window = {
                completion = {
                    border = BORDER,
                    col_offset = -3,
                    side_padding = 0,
                    winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
                },
                documentation = {
                    winhighlight = "Normal:Float,FloatBorder:FloatBorder",
                    border = BORDER,
                },
            },
            formatting = {
                fields = {
                    "kind",
                    "abbr",
                    "menu",
                },
                format = function(_, vim_item)
                    local icons = require("lspkind_icons")
                    local icon = icons[vim_item.kind]
                    local menu = vim_item.kind
                    vim_item.kind = icon
                    vim_item.abbr = string.sub(vim_item.abbr, 1, 75)
                    vim_item.menu = "   (" .. menu .. ")"

                    return vim_item
                end,
            },
            view = {
                entries = {
                    name = "custom",
                },
            },
            sorting = {
                comparators = {
                    cmp.config.compare.score,
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.scopes,
                    cmp.config.compare.kind,
                    cmp.config.compare.offset,
                }
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-space>"] = cmp.mapping.complete(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif vim.fn["vsnip#available"](1) == 1 then
                        feedkey("<Plug>(vsnip-expand-or-jump)", "")
                    elseif has_words_before() then
                        cmp.complete(nil)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                        feedkey("<Plug>(vsnip-jump-prev)", "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<CR>"] = cmp.mapping.confirm({ select = false })
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lsp" },
                { name = "vsnip" },
                { name = "crates" },
                { name = "cmp_zsh" },
            },
                {
                    { name = "buffer" },
                }),
        })

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "cmp_git" },
            },
                {
                    { name = "buffer" },
                }),
            sorting = {
                comparators = {
                    cmp.config.compare.score,
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.scopes,
                    cmp.config.compare.kind,
                    cmp.config.compare.offset,
                }
            },
        })

        cmp.setup.filetype("lua", {
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "cmp_nvim_lua" },
                { name = "buffer" },
            }),
            sorting = {
                comparators = {
                    cmp.config.compare.score,
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.scopes,
                    cmp.config.compare.kind,
                    cmp.config.compare.offset,
                }
            },
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "nvim_lsp_document_symbol" },
                { name = "buffer" },
            }),
            sorting = {
                comparators = {
                    cmp.config.compare.score,
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.scopes,
                    cmp.config.compare.kind,
                    cmp.config.compare.offset,
                }
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "fuzzy_path" },
                { name = "cmdline" },
            }),
            sorting = {
                comparators = {
                    cmp.config.compare.score,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.offset,
                }
            },
        })
    end
}
packer.use { "kosayoda/nvim-lightbulb",
    config = function()
        require("nvim-lightbulb").setup({
            autocmd = {
                enabled = true
            }
        })
    end
}

vim.cmd [[packadd nvim-lspconfig]]
