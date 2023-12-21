local map = require("map")
local border = require("ui.border").with_hl_group

return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 9000,
        config = function(_, options)
            require("onedark").setup(options)
            require("onedark").load()
        end,
        opts = {
            colors = {
                black = "#181818",
                bg = "#262b33",
                fg = "#9daaaa",
                red = "#c65156",
                yellow = "#dbba75",
                orange = "#d29767",
                green = "#83a76e",
                purple = "#c67ada",
                diff_add = "83a76e",
                diff_delete = "#c65156",
                diff_change = "#61afef",
                cyan = "#00997b",
            },
        }
    },
    {
        "stevearc/dressing.nvim",
        lazy = true,
        event = "VeryLazy",
        config = function(_, _)
            local override = function(conf)
                conf.anchor = "NW"
                return conf
            end
            require("dressing").setup {
                input = {
                    enabled = true,
                    insert_only = true,
                    start_in_insert = true,
                    border = require("ui.border").with_hl_group,
                    override = override,
                    win_options = {
                        winblend = 0,
                    },
                },
                select = {
                    backend = {
                        "telescope",
                        "fzf_lua",
                        "fzf",
                        "nui",
                        "builtin",
                    },
                    nui = {
                        border = require("ui.border").with_hl_group,
                        override = override,
                        win_options = {
                            winblend = 0,
                        },
                    },
                    builtin = {
                        border = require("ui.border").with_hl_group,
                        override = override,
                        win_options = {
                            winblend = 0,
                        },
                    },
                },
            }
        end
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        config = function(_, _)
            require("nvim-web-devicons").setup {}
        end,
    },
    {
        "MunifTanjim/nui.nvim",
        lazy = true,
    },
    {
        "m-demare/hlargs.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        ft = {
            "c,",
            "cpp",
            "cxx",
            "cppm",
            "h",
            "hpp",
            "hxx",
            "python",
            "rust",
            "lua",
        },
        config = function(_, options)
            require("hlargs").setup(options)
        end,
        opts = {
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
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
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
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function(_, options)
            require("treesitter-context").setup(options)
        end,
        opts = {
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
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = {
            "BufWinEnter",
        },
        cond = function()
            return vim.fn.isdirectory(".git/index")
        end,
        opts = {
            current_line_blame = true,
            current_line_blame_formatter = " <author> • <author_time:%R> • <summary>",
            current_line_blame_opts = {
                delay = 0
            }
        },
        config = function(_, options)
            require("gitsigns").setup(options)

            map.nmap("<S-A-d>", "<cmd>lua package.loaded.gitsigns.diffthis()<CR>", "Show git diff for file")
            map.nmap("<leader>diff", "<cmd>lua package.loaded.gitsigns.diffthis()<CR>", "Show git diff for file")
        end
    },
    {
        "declancm/cinnamon.nvim",
        lazy = true,
        event = "VeryLazy",
        config = function(_, options)
            require("cinnamon").setup(options)
        end,
        opts = {
            default_keymaps = true,
            extra_keymaps = false,
            extended_keymaps = true,
            always_scroll = false,
            centered = false,
            default_delay = 0.1,
            horizontal_scroll = true,
            scroll_limit = 50,
        },
    },
    {
        "rcarriga/nvim-notify",
        lazy = true,
        config = function(_, options)
            require("notify").setup(options)
        end,
        opts = {
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
        },
    },
    {
        "folke/noice.nvim",
        lazy = true,
        keys = {
            "<cmd>",
            ":",
            "/",
            "<search>",
        },
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function(_, _)
            local noice_border = require("ui.border").without_hl_group

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
                messages = {
                    enabled = true,
                    view = "notify",
                },
                presets = {
                    bottom_search = false,
                    --command_palette = true,
                    long_message_to_split = true,
                    inc_rename = true,
                },
                views = {
                    cmdline_popup = {
                        position = {
                            row = 5,
                            col = "50%"
                        },
                        size = {
                            width = "40%",
                            height = "auto",
                        },
                        border = {
                            style = noice_border,
                            padding = { 0, 0 },
                        },
                        win_options = {
                            winblend = 0,
                            winhighlight = "Normal:Pmenu,FloatBorder:NoiceBorder",
                        },
                    },
                    popupmenu = {
                        border = {
                            style = noice_border,
                            padding = { 0, 0 },
                        },
                        win_options = {
                            winblend = 0,
                            winhighlight = "Normal:Pmenu,FloatBorder:NoiceBorder",
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
                            winhighlight = "Normal:Pmenu,FloatBorder:NoiceBorder",
                        },
                    },
                },
            }

            vim.cmd("hi! link NoiceCmdlinePopupBorder NoiceBorder")
            vim.cmd("hi! link NoiceConfirmBorder NoiceBorder")
        end
    },
    {
        "CosmicNvim/cosmic-ui",
        lazy = true,
        keys = {
            "<leader>rn",
            "<A-cr>",
            "<S-c>",
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function(_, _)
            require("cosmic-ui").setup {}

            map.nmap("<Leader>rn", "<cmd>lua require(\"cosmic-ui\").rename()<CR>", "Rename")
            map.nmap("<A-CR>", "<cmd>lua require(\"cosmic-ui\").code_actions()<CR>", "Code Actions")
            map.nmap("<S-c>", "<cmd>lua require(\"cosmic-ui\").code_actions()<CR>", "Code Actions")
        end
    },
    {
        "folke/which-key.nvim",
        config = function(_, options)
            require("which-key").setup(options)
        end,
        opts = {
            window = {
                border = border,
                margin = { 2, 2, 2, 2 },
                winblend = 1
            },
        }
    },
    {
        "goolord/alpha-nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function(_, _)
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end
    },
    {
        "NvChad/nvim-colorizer.lua",
        lazy = true,
        event = "FileType",
        config = function(_, options)
            require("colorizer").setup(options)
            vim.schedule(function()
                require("colorizer").attach_to_buffer(0)
            end)
            vim.api.nvim_create_autocmd(
                {
                    "FileType"
                },
                {
                    pattern = "*",
                    callback = function()
                        vim.schedule(function()
                            require("colorizer").attach_to_buffer(0)
                        end)
                    end
                })
        end,
        opts = {
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
        },
    },
    {
        "utilyre/barbecue.nvim",
        lazy = true,
        event = {
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
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
        },
        config = function(_, options)
            require("barbecue").setup(options)

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
        opts = {
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
                "alpha",
                "Trouble",
                "packer",
                "gitcommit",
                "toggleterm",
                "aerial",
                "neo-tree",
                "terminal",
            },
        },
    },
    {
        "stevearc/aerial.nvim",
        lazy = true,
        keys = "<S-m>",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function(_, options)
            require("aerial").setup(options)

            map.nmap("<S-m>", "<cmd>AerialToggle!<CR>", "Toggles the Aerial Overview")
        end,
        opts = {
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
                border = border,
                relative = "win",
                max_height = 1.0,
                min_height = { 1.0, 1.0 },
            },
        },
    },
    {
        "kosayoda/nvim-lightbulb",
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
        config = function(_, options)
            require("nvim-lightbulb").setup(options)
        end,
        opts = {
            autocmd = {
                enabled = true,
            },
        },
    },
    {
        "dstein64/nvim-scrollview",
        lazy = true,
        event = "BufWinEnter",
        branch = "main",
        opts = {
            scrollview_column = 1,
        },
    },
    {
        "petertriho/nvim-scrollbar",
        lazy = true,
        event = "BufWinEnter",
        config = function(_, options)
            require("scrollbar").setup(options)

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
        end,
        opts = {
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
    },
    {
        "yamatsum/nvim-cursorline",
        lazy = true,
        event = "BufWinEnter",
        opts = {
            cursorline = {
                enable = true,
                timeout = 0,
                number = true,
            },
            cursorword = {
                enable = false,
            },
        },
    },
    {
        "folke/trouble.nvim",
        lazy = true,
        event = "DiagnosticChanged",
        keys = {
            "<C-l>",
            "<C-l><C-k>"
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-tree/nvim-web-devicons",
        },
        config = function(_, options)
            require("trouble").setup(options)

            map.nmap("<C-l>", "<cmd>Trouble document_diagnostics<CR>", "Show Diagnostics")
            map.nmap("<C-l><C-k>", "<cmd>TroubleClose<CR>", "Close Diagnostics")
        end,
        opts = {
            mode = "document_diagnostics",
            icons = true,
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
                debug = " ",
                error = " ",
                warning = " ",
                hint = " ",
                information = " "
            },
            use_diagnostic_signs = false,
        },
    },
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        config = function(_, options)
            require("bufferline").setup(options)

            map.nmap("<C-p>", "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer")
            map.nmap("<C-n>", "<cmd>BufferLineCycleNext<CR>", "Next Buffer")
            map.nmap("<C-m><C-p>", "<cmd>BufferLineMovePrev<CR>", "Move Buffer Back One")
            map.nmap("<C-m><C-n>", "<cmd>BufferLineMoveNext<CR>", "Move Buffer Forward One")
        end,
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "",
                        highlight = "Directory",
                        text_align = "left",
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
                    delay = 100,
                    reveal = {
                        "close"
                    },
                },
            }
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function(_, _)
            local trim = function(from_start)
                return function(str, _)
                    local max_len = vim.o.columns / 5
                    local len = string.len(str)
                    if len > max_len then
                        if from_start then
                            return "..." .. string.sub(str, (len - max_len) + 3)
                        end
                        return string.sub(str, 0, max_len - 3) .. "..."
                    end
                    return str
                end
            end
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
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    always_divide_middle = true,
                    globalstatus = true,
                },
                extensions = {
                    "aerial",
                    "quickfix",
                    "fugitive",
                    "neo-tree",
                    "nvim-dap-ui",
                    "toggleterm",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        {
                            "branch",
                            fmt = trim(false),
                        },
                        {
                            "diff",
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
                            "filename",
                            file_status = true,
                            path = 1,
                            fmt = trim(true),
                        },
                        {
                            "%w",
                            cond = function()
                                return vim.wo.previewwindow
                            end,
                        },
                        {
                            "%r",
                            cond = function()
                                return vim.bo.readonly
                            end,
                        },
                        {
                            "%q",
                            cond = function()
                                return vim.bo.buftype == "quickfix"
                            end,
                        },
                        {
                            "searchcount",
                        },
                    },
                    lualine_c = {},
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            sections = { "error", "warn", "info" },
                            symbols = {
                                error = " ",
                                warn = " ",
                                info = " ",
                            },
                            update_in_insert = true,
                            always_visible = true,
                        },
                    },
                    lualine_y = {
                        {
                            "filetype"
                        },
                        {
                            "encoding"
                        },
                        {
                            "fileformat"
                        },
                    },
                    lualine_z = {
                        {
                            "location"
                        },
                        {
                            "progress"
                        }
                    },
                },
                inactive_sections = {
                    lualine_c = { "%f %y %m" },
                    lualine_x = {},
                },
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        keys = {
            "<leader>td",
            "<leader>eval",
            "<S-e>",
        },
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, _)
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
                            { id = "stacks",      size = 0.2 },
                            { id = "breakpoints", size = 0.2 },
                            --"watches",
                            { id = "scopes",      size = 0.6 },
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
                require("nvim-dap-virtual-text")
                vim.cmd("DapVirtualTextEnable")
                dap.repl.close()
            end
            dap.listeners.before.event_initialized["dapui_config"] = function()
                dapui.close {}
                require("nvim-dap-virtual-text")
                vim.cmd("DapVirtualTextForceRefresh")
                dap.repl.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                --dapui.close{}
                require("nvim-dap-virtual-text")
                vim.cmd("DapVirtualTextForceRefresh")
                dap.repl.close()
            end
            dap.listeners.after.event_stopped["dapui_config"] = function()
                dap.repl.close()
            end
            dap.listeners.after.event_output["dapui_config"] = function()
                dap.repl.close()
            end

            map.nmap("<leader>td", "<cmd>lua require(\"dapui\").toggle()<CR>", "Toggle Debugger UI")
            map.nmap("<leader>eval", "<cmd>lua require(\"dapui\").eval()<CR>", "Debugger Evaluate Expression")
            map.vmap("<leader>eval", "<cmd>lua require(\"dapui\").eval()<CR>", "Debugger Evaluate Expression")
            map.nmap("<S-e>", "<cmd>lua require(\"dapui\").eval()<CR>", "Debugger Evaluate Expression")
            map.vmap("<S-e>", "<cmd>lua require(\"dapui\").eval()<CR>", "Debugger Evaluate Expression")
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
        ft = {
            "c,",
            "cpp",
            "cxx",
            "cppm",
            "h",
            "hpp",
            "hxx",
            "rust",
            "toml",
        },
        cmd = {
            "DapVirtualTextEnable",
            "DapVirtualTextForceRefresh",
            "DapVirtualTextDisable",
        },
        config = function(_, _)
            require("nvim-dap-virtual-text").setup {
                enabled = true,
                enabled_commands = true,
            }
        end,
    },
    {
        "luukvbaal/statuscol.nvim",
        lazy = true,
        event = "BufReadPost",
        -- until luukvbaal fixes numbers
        -- commit = "49a3bdab3e9cf23982724c1e888a6296fca4c8b9",
        opts = {
            relculright = true,
            setopt = true,
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            "<S-f>",
            "<S-A-g>",
        },
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function(_, _)
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

            map.nmap("<S-f>",
                "<cmd>lua require(\"telescope.builtin\").find_files(require(\"telescope.themes\").get_dropdown({}))<CR>"
                ,
                "Telescope Find Files")
            map.nmap("<S-A-g>",
                "<cmd>lua require(\"telescope.builtin\").live_grep(require(\"telescope.themes\").get_dropdown({}))<CR>",
                "Telescope Live Grep")
        end
    },
    {
        "tzachar/fuzzy.nvim",
        lazy = true,
        dependencies = "nvim-telescope/telescope-fzf-native.nvim",
    },
    {
        "FeiyouG/command_center.nvim",
        lazy = true,
        keys = "<A-S-p>",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function(_, _)
            require("telescope").load_extension("command_center")
            map.nmap("<A-S-p>", "<cmd>Telescope command_center<CR>", "Open Command Center")

            local mappings = map.get_command_center_mappings()
            local command_center = require("command_center")

            for _, mapping in pairs(mappings) do
                command_center.add(mapping, { command_center.mode.ADD })
            end
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        main = "ibl",
        event = "VeryLazy",
        config = function(_, _)
            require("ibl").setup {
            }
        end
    },
    {
        "lukas-reineke/virt-column.nvim",
        lazy = true,
        event = "BufWinEnter",
    },
    {
        url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        name = "lsp_lines",
        lazy = true,
        event = "DiagnosticChanged",
        dependencies = "neovim/nvim-lspconfig",
        config = function(_, _)
            require("lsp_lines").setup()
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = {
                    prefix = "🔥",
                },
            })
        end,
    },
    {
        "NvChad/nvterm",
        lazy = true,
        keys = {
            "<S-t>",
            "<C-S-t>",
        },
        config = function(_, options)
            require("nvterm").setup(options)

            map.nmap("<S-t>", "<cmd>lua require(\"nvterm.terminal\").toggle \"horizontal\"<CR>", "Open NvTerm")
            --map.nmap("<T>", "<cmd>lua require(\"nvterm.terminal\").toggle \"horizontal\"<CR>", "Open NvTerm")
            map.nmap("<C-S-t>", "<cmd>lua require(\"nvterm.terminal\").toggle \"float\"<CR>", "Open NvTerm in float")

            map.tmap("<S-t>", "<cmd>lua require(\"nvterm.terminal\").toggle \"horizontal\"<CR>", "Close NvTerm")
            --map.tmap("<T>", "<cmd>lua require(\"nvterm.terminal\").toggle \"horizontal\"<CR>", "Close NvTerm")
            map.tmap("<C-S-t>", "<cmd>lua require(\"nvterm.terminal\").toggle \"float\"<CR>", "Close NvTerm")
        end,
        opts = {
            terminals = {
                list = {},
                type_opts = {
                    float = {
                        relative = "editor",
                        row = 0.3,
                        col = 0.25,
                        width = 0.6,
                        height = 0.3,
                        border = border,
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
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        lazy = true,
        cmd = "Neotree",
        keys = "<C-t>",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker",
                opts = {
                    autoselect_one = false,
                    include_current = false,
                    filter_rules = {
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = {
                                "Trouble",
                                "packer",
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
                },
            },
        },
        config = function(_, options)
            vim.cmd("let g:neo_tree_remove_legacy_commands = 1")
            require("neo-tree").setup(options)
            map.nmap("<C-t>", "<cmd>Neotree toggle<CR>", "Toggle NeoTree")
        end,
        opts = {
            sources = {
                "filesystem",
                "git_status",
            },
            source_selector = {
                winbar = true,
                statusline = false,
                show_scrolled_off_parent_node = false,
                content_layout = "start",
                sources = {
                    {
                        source = "filesystem",
                        display_name = "  File",
                    },
                    {
                        source = "buffers",
                        display_name = " Buffer",
                    },
                    {
                        source = "git_status",
                        display_name = " Git",
                    },
                    {
                        source = "diagnostics",
                        display_name = "裂Lints",
                    },
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
                width = 25,
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
                    width = 25,
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
                    width = 25,
                    mappings = {
                        ["bd"] = "buffer_delete",
                    },
                },
            },
            git_status = {
                follow_current_file = true,
                window = {
                    position = "left",
                    width = 25,
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
                    event = "neo_tree_buffer_enter",
                    handler = function(_)
                        vim.opt_local.signcolumn = "auto"
                    end,
                },
            },
        },
    },
}
