----------------------------------------------
-- PLUGINS IN USE
----------------------------------------------
local packer = require('packer')

packer.use "vim-scripts/DoxygenToolkit.vim"
packer.use "kyazdani42/nvim-web-devicons"
packer.use "leafgarland/typescript-vim"
packer.use "vim-autoformat/vim-autoformat"
packer.use {
    "folke/noice.nvim",
    requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify"
    },
    config = function()
        local noice_border = {
            "┏",
            "━",
            "┓",
            "┃",
            "┛",
            "━",
            "┗",
            "┃",
        }
        require("noice").setup {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                hover = {
                    enabled = true,
                },
                signature = {
                    enabled = true,
                    auto_open = {
                        enabled = true,
                        trigger = true,
                        luasnip = true,
                        throttle = 40,

                    },
                },
                progress = {
                    enabled = true,
                    throttle = 1000 / 24,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                inc_rename = true,
            },
            views = {
                cmdline_popup = {
                    border = {
                        style = noice_border,
                        padding = { 0, 0 },
                    },
                    win_options = {
                        winblend = 0,
                        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder",
                    },
                },
                popupmenu = {
                    border = {
                        style = noice_border,
                        padding = { 0, 0 },
                    },
                    win_options = {
                        winblend = 0,
                        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder",
                    },
                },
                hover = {
                    relative = "cursor",
                    position = {
                        row = 2,
                        col = 2,
                    },
                    border = {
                        style = noice_border,
                        padding = { 0, 0 },
                    },
                    win_options = {
                        winblend = 0,
                        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder",
                    },
                },
            },
        }

        vim.cmd("hi! link NoiceCmdlinePopupBorder FloatBorder")
        vim.cmd("hi! link NoiceConfirmBorder FloatBorder")
    end,
}
packer.use {
    "NvChad/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup {
            user_default_options = {
                RGB = true,
                RRGGBB = true,
                names = true,
                RRGGBBAA = true,
                AARRGGBB = true,
                css_fn = true,
                sass = {
                    enable = true,
                    parsers = {
                        "css"
                    },
                },
            }
        }
    end
}
packer.use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
}
packer.use {
    "utilyre/barbecue.nvim",
    requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
    },
    config = function()
        require("barbecue").setup {
            attach_navic = false,
            show_modified = true,
            symbols = {
                separator = "",
            },
            create_autocmd = false,
            kinds = require("lspkind_icons"),
            theme = {
                normal = { fg = "#9daaaa", bg = "#24292f" }
            },
            include_buftypes = {
                ""
            },
            exclude_filetypes = {
                "gitcommit",
                "toggleterm",
                "aerial",
                "neo-tree",
                "terminal",
            },
        }

        vim.api.nvim_create_autocmd(
            {
                "WinScrolled",
                "BufWinEnter",
                "CursorHold",
                "CursorMoved",
                "CursorMovedI",
                "InsertLeave",
                "BufWritePost",
                "TextChanged",
                "TextChangedI",
            },
            {
                group = vim.api.nvim_create_augroup("barbecue#create_autocmd", {}),
                callback = function()
                    require("barbecue.ui").update()
                end
            })
    end,
}
packer.use {
    "luukvbaal/statuscol.nvim",
    after = "nvim-dap",
    config = function()
        require("statuscol").setup {
            relculright = true,
            setopt = true,
        }
    end,
}
packer.use { "phaazon/hop.nvim",
    config = function()
        require("hop").setup {
            teasing = false,
            jump_on_sole_occurrence = false,
            case_insensitive = false,
        }
    end
}
packer.use "mfussenegger/nvim-jdtls"
packer.use "tpope/vim-fugitive"
--packer.use { "/home/braxton/git/blame_line.nvim",
--    as = "blame_line.nvim",
--    config = function()
--    	require("blame_line").setup {
--    	}
--    end
--}
packer.use { "barreiroleo/ltex-extra.nvim",
}
packer.use "cespare/vim-toml"
packer.use "HerringtonDarkholme/yats.vim"
packer.use { "FeiyouG/command_center.nvim",
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
            color = "#588496",
            excluded_argnames = {
                declarations = {
                    python = { "self", "cls" },
                    lua = { "self" },
                    rust = { "self" },
                    cpp = { "this", }
                },
                usages = {
                    python = { "self", "cls" },
                    lua = { "self" },
                    rust = { "self" },
                    cpp = { "this", }
                }
            },
            paint_arg_declarations = true,
            paint_arg_usages = true,
            paint_catch_blocks = {
                declarations = true,
                usages = true,
            },
            extras = {
                named_parameters = true
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
            attach_mode = "global",
            default_bindings = true,
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
            layout = {
                max_width = { 30, 0.2 },
                min_width = 20,
                default_direction = "right",
                placement = "edge",
            },
            show_guides = true,
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
packer.use { "folke/neodev.nvim",
    config = function()
        require("neodev").setup({
            library = {
                plugins = {
                    "nvim-dap-ui",
                },
                types = true,
            }
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
                        ["<S-j>"] = actions.move_selection_next,
                        ["<S-k>"] = actions.move_selection_previous,
                        ["<S-A-j>"] = actions.preview_scrolling_down,
                        ["<S-A-k>"] = actions.preview_scrolling_up,
                    },
                    n = {
                        ["<S-j>"] = actions.move_selection_next,
                        ["<S-k>"] = actions.move_selection_previous,
                        ["<S-A-j>"] = actions.preview_scrolling_down,
                        ["<S-A-k>"] = actions.preview_scrolling_up,
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
--packer.use "Raimondi/delimitMate"
packer.use {
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup {
        }
    end
}
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
packer.use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        {
            -- only needed if you want to use the commands with "_with_window_picker" suffix
            's1n7ax/nvim-window-picker',
            tag = "v1.*",
            config = function()
                require 'window-picker'.setup({
                    autoselect_one = false,
                    include_current = false,
                    filter_rules = {
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = {
                                "neo-tree",
                                "neo-tree-popup",
                                "notify",
                                "aerial",
                                "packer"
                            },
                            -- if the buffer type is one of following, the window will be ignored
                            buftype = {
                                "terminal",
                                "quickfix"
                            },
                        },
                    },
                    other_win_hl_color = "#61afef",
                })
            end,
        }
    },
    config = function()
        vim.cmd("let g:neo_tree_remove_legacy_commands = 1")
        require("neo-tree").setup {
            sources = {
                "filesystem",
                "git_status",
            },
            source_selector = {
                winbar = true,
                statusline = false,
                show_scrolled_off_parent_node = false,
                content_layout = "start",
                tab_labels = {
                    filesystem = "  File",
                    buffers = " Buffer",
                    git_status = " Git",
                    diagnostics = "裂Lints"
                }
            },
            hide_root_node = true,
            expand_all_nodes = false,
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = true,
            use_default_mappings = false,
            sort_case_insensitive = true,
            default_component_configs = {
                indent = {
                    indent_size = 2,
                    padding = 1,
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    highlight = "NeoTreeIndentMarker",
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                },
                git_status = {
                    symbols = {
                        added = "",
                        deleted = "",
                        modified = "",
                        renamed = "➜",
                        untracked = "★",
                        ignored = "◌",
                        unstaged = "✗",
                        staged = "✓",
                        conflict = "",
                    },
                },
            },
            window = {
                position = "left",
                width = 30,
                mappings = {
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    ["e"] = "open",
                    ["s"] = "open_vsplit",
                    ["R"] = "refresh",
                    ["a"] = "add",
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["q"] = "close_window",
                    ["<C-t>"] = "close_window",
                    ["<C-n>"] = "next_source",
                    ["<C-p>"] = "prev_source",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        ".DS_Store",
                        "thumbs.db",
                        "node_modules",
                        "__pycache__",
                    },
                },
                follow_current_file = true,
                hijack_netrw_behavior = "open_current",
                use_libuv_file_watcher = true,
                window = {
                    position = "left",
                    width = 30,
                    mappings = {
                        ["H"] = "toggle_hidden",
                        ["/"] = "filter_on_submit",
                        ["<c-x>"] = "clear_filter",
                    },
                },
            },
            buffers = {
                show_unloaded = true,
                window = {
                    position = "left",
                    width = 30,
                    mappings = {
                        ["bd"] = "buffer_delete",
                    },
                },
            },
            git_status = {
                follow_current_file = true,
                window = {
                    position = "left",
                    width = 30,
                    mappings = {
                        ["A"] = "git_add_all",
                        ["u"] = "git_unstage_file",
                        ["a"] = "git_add_file",
                        ["r"] = "git_revert_file",
                        ["c"] = "git_commit",
                        ["p"] = "git_push",
                        ["cp"] = "git_commit_and_push",
                    },
                },
            },
            event_handlers = {
                {
                    event = "vim_buffer_enter",
                    handler = function(_)
                        if vim.bo.filetype == "neo-tree" then
                            vim.wo.signcolumn = "auto"
                        end
                    end,
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
                        filetype = "packer",
                        text = "Packer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                    {
                        filetype = "neo-tree",
                        text = "",
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
                color_icons = true,
                show_buffer_icons = true,
                show_tab_indicators = true,
                separator_style = "thick",
                always_show_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {
                        "close"
                    },
                },
            }
        }
    end
}
packer.use { "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        --notify is routed with noice.nvim
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
                timeout = 3500,
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
                'aerial',
                'quickfix',
                'fugitive',
                'neo-tree',
                'nvim-dap-ui',
                'toggleterm',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        colored = true,
                        diff_color = {
                            added = "DiffAdd",
                            modified = "DiffChange",
                            removed = "DiffDelete",
                        },
                        symbols = {
                            added = " ",
                            removed = " ",
                            modified = " ",
                        },
                    },
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
                    {
                        "searchcount",
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
        })
    end,
}

PATH_SEP = function()
    return package.config:sub(1, 1)
end

packer.use { "mfussenegger/nvim-dap",
    after = "mason.nvim",
    config = function()
        local dap = require("dap")
        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = vim.fn.stdpath("data") .. PATH_SEP() .. "mason" .. PATH_SEP() .. "bin"
                    .. PATH_SEP() .. "codelldb",
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
}

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

packer.use { "p00f/clangd_extensions.nvim",
    after = { "nvim-lspconfig", "nvim-semantic-tokens", },
    config = function()
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
    end,
}
packer.use { "neovim/nvim-lspconfig",
    after = {
        "neodev.nvim",
        "aerial.nvim",
        "nvim-semantic-tokens",
    },
    config = function()
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
                ["<C-Space>"] = cmp.mapping.complete(),
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
