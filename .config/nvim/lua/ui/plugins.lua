local map = require("map")
local border = require("ui.border").with_hl_group

return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 10000,
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
                diff_add = "#83a76e",
                diff_delete = "#c65156",
                diff_change = "#61afef",
                cyan = "#00997b",
            },
            highlights = {
                ["Float"] = {bg = "#20242b", fg="#9daaaa"},
                ["FloatNormal"] = {bg = "#20242b", fg="#9daaaa"},
                ["NormalFloat"] = {bg = "#20242b", fg="#9daaaa"},
            },
            code_style = {
                keywords = "italic",
            }
        }
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
            keymaps = {
                basic = true,
                extra = true,
            },
            options = {
                delay = 0.1,
                mode = "window",
                max_delta = {
                    time = 50
                },
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        lazy = true,
        --config = function(_, options)
        --    require("notify").setup(options)
        --end,
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
            local noice_border = require("ui.border").with_hl_group

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
                    documentation = {
                        opts = {
                            win_options = {
                                winblend = 1,
                                winhighlight = {
                                    Normal = "Pmenu",
                                    FloatBorder = "FloatBorder",
                                    EndOfBuffer = 'FloatNormal',
                                },
                            },
                        }
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
                            winblend = 1,
                            winhighlight = {
                                Normal = "Pmenu",
                                FloatBorder = "NoiceBorder",
                                EndOfBuffer = 'FloatNormal',
                            },
                        },
                    },
                    popupmenu = {
                        border = {
                            style = noice_border,
                            padding = { 0, 0 },
                        },
                        win_options = {
                            winblend = 1,
                            winhighlight = {
                                Normal = "Pmenu",
                                FloatBorder = "NoiceBorder",
                                EndOfBuffer = 'FloatNormal',
                            },
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
                            winblend = 1,
                            winhighlight = {
                                Normal = "Pmenu",
                                FloatBorder = "NoiceBorder",
                                EndOfBuffer = 'FloatNormal',
                            },
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
            map.nmap("<A-CR>", "<cmd>lua require(\"map\").codeaction()<CR>", "Code Actions")
            map.nmap("<S-c>", "<cmd>lua require(\"map\").codeaction()<CR>", "Code Actions")
        end
    },
    {
        "folke/which-key.nvim",
        config = function(_, options)
            require("which-key").setup(options)
        end,
        opts = {
            preset = "modern",
            delay = 200,
            win = {
                border = border,
                padding = { 2, 2 },
                wo = {
                    winblend = 1,
                    winhighlight = 'EndOfBuffer:FloatNormal',
                },
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
                "terminal",
                "snacks_layout_box",
                "snacks_picker_list",
                "snacks_picker_input",
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
            excluded_filetypes = {
                'snacks_picker_list',
                'snacks_layout_box',
            },
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
            handle = {
                color = "#262b33"
            },
            marks = {
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
            {
                "<C-l>",
                "<cmd>Trouble snacks toggle filter.buf=0<CR>",
                "Show Diagnostics",
            },
            {
                "<C-l><C-k>",
                "<cmd>Trouble snacks close filter.buf=0<CR>",
                "Close Diagnostics",
            },
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-tree/nvim-web-devicons",
        },
        config = function(_, options)
            require("trouble").setup(options)

            map.nmap("<C-l>", "<cmd>Trouble diagnostics open filter.buf=0<CR>", "Show Diagnostics")
            map.nmap("<C-l><C-k>", "<cmd>Trouble diagnostics close filter.buf=0<CR>", "Close Diagnostics")
        end,
        opts = {
            focus = true,
            warn_no_results = false,
            open_no_results = true,
            auto_preview = true,
            action_keys = {
                ["<C-l>"] = "open",
                ["<C-l><C-k>"] = "close",
                ["<esc>"] = "cancel",
                ["<C-r>"] = "refresh",
                ["<CR>"] = "jump",
                ["<C-A-S-h>"] = "jump_split",
                ["<C-A-S-s>"] = "jump_vsplit",
                ["<C-CR>"] = "jump_close",
            },
            win = {
                colorcolumn = "",
            },
        },
        specs = {
            "folke/snacks.nvim",
            opts = function(_, opts)
                return vim.tbl_deep_extend("force", opts or {}, {
                    picker = {
                        actions = require("trouble.sources.snacks").actions,
                        win = {
                            input = {
                                keys = {
                                    ["<C-l>"] = {
                                        "trouble_open",
                                        mode = { "n", "i" },
                                    },
                                },
                            },
                        },
                    },
                })
            end
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
                        filetype = "snacks_layout_box",
                        text = "",
                        highlight = "ExplorerBackground",
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
        dependencies = {
            "lewis6991/gitsigns.nvim",
        },
        -- until luukvbaal fixes numbers
        -- commit = "49a3bdab3e9cf23982724c1e888a6296fca4c8b9",
        opts = {
            relculright = true,
            setopt = true,
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = true,
        keys = {
            "<S-f>",
            "<S-A-g>",
            "<C-S-f>",
            "<A-S-p>",
            "<C-c>",
            "<leader>f",
            "<leader>g",
            "<leader>k",
            "<leader>git",
            "<C-t>",
            "gd",
            "gc",
            "gi",
            "ref",
            "<C-l>",
        },
        config = function(_, opts)
            require("snacks").setup(opts)

            map.nmap("<S-f>",
                "<cmd>lua require(\"snacks\").picker.smart()<CR>",
                "Smart Find Files"
            )
            map.nmap("<leader>f",
                "<cmd>lua require(\"snacks\").picker.smart()<CR>",
                "Smart Find Files"
            )
            map.nmap("<S-A-g>",
                "<cmd>lua require(\"snacks\").picker.grep()<CR>",
                "Grep"
            )
            map.nmap("<C-S-f>",
                "<cmd>lua require(\"snacks\").picker.grep()<CR>",
                "Grep"
            )
            map.nmap("<leader>g",
                "<cmd>lua require(\"snacks\").picker.grep()<CR>",
                "Grep"
            )
            map.nmap("<A-S-p>",
                "<cmd>lua require(\"snacks\").picker.commands()<CR>",
                "Commands"
            )
            map.nmap("<leader>k",
                "<cmd>lua require(\"snacks\").picker.keymaps()<CR>",
                "Commands"
            )
            map.nmap("<C-c>",
                "<cmd>lua require(\"snacks\").bufdelete()<CR>",
                "Bufdelete"
            )
            map.nmap("<leader>git",
                "<cmd>lua require(\"snacks\").lazygit()<CR>",
                "Lazygit"
            )
            local openExplorer = function()
                local snacks = require("snacks")
                local explorer = snacks.picker.get(({source="explorer"}))[1]
                if explorer ~= nil then
                    if not explorer:is_focused() then
                        explorer:focus()
                    end
                    return
                end
                snacks.explorer()
            end

            map.nmap("<C-t>",
                openExplorer,
                "Explorer"
            )

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
        end,
        opts = {
            bufdelete = {
                enabled = true,
            },
            picker = {
                match = {
                    cwd_bonus = true,
                    frecency = true,
                    history_bonus = true,
                },
                formatters = {
                    file = {
                        filename_first = true,
                    },
                },
                icons = {
                    diagnostics = {
                        Error = " ",
                        Warn = " ",
                        Hint = " ",
                        Info = " "
                    },
                    kinds = require("lspkind_icons")
                },
                win = {
                    input = {
                        keys = {
                            ['<Tab>'] = { 'list_down', mode = {'i', 'n'}},
                            ['<S-Tab>'] = { 'list_up', mode = {'i', 'n'}},
                        },
                        wo = {
                            winblend = 1,
                            winhighlight = 'EndOfBuffer:FloatNormal',
                        },
                    },
                    list = {
                        wo = {
                            winblend = 1,
                            winhighlight = 'EndOfBuffer:FloatNormal',
                        },
                        keys = {
                            ["<BS>"] = "explorer_up",
                            ["l"] = "confirm",
                            ["e"] = "confirm",
                            ["<CR>"] = "confirm",
                            ["h"] = "explorer_close", -- close directory
                            ["a"] = "explorer_add",
                            ["d"] = "explorer_del",
                            ["r"] = "explorer_rename",
                            ["c"] = "explorer_copy",
                            ["m"] = "explorer_move",
                            ["o"] = "explorer_open", -- open with system application
                            ["P"] = "toggle_preview",
                            ["y"] = { "explorer_yank", mode = { "n", "x" } },
                            ["p"] = "explorer_paste",
                            ["u"] = "explorer_update",
                            ["."] = "explorer_focus",
                            ["<C-c>"] = "tcd",
                            ["I"] = "toggle_ignored",
                            ["H"] = "toggle_hidden",
                            ["<esc>"] = { "", mode = "n" },
                            ["<C-t>"] = { "", mode = "n" },
                        },
                    },
                },
                sources = {
                    explorer = {
                        tree = true,
                        diagnostics = true,
                        diagnostics_open = true,
                        git_status = true,
                        git_status_open = true,
                        git_untracked = true,
                        follow_file = false,
                        auto_close = false,
                        focus = "list",
                        hidden = true,
                        ignored = true,
                        exclude = {},
                        jump = {
                            close = false,
                        },
                        matcher = {
                            sort_empty = false,
                            fuzzy = true,
                        },
                        win = {
                            input = {
                                keys = {
                                    ["<esc>"] = { "", mode = "n" },
                                },
                            },
                            list = {
                                wo = {
                                    winblend = 1,
                                    winhighlight = 'EndOfBuffer:FloatNormal',
                                },
                                keys = {
                                    ["<C-t>"] = { "cancel", mode = "n" },
                                }
                            },
                        },
                        layout = {
                            layout = {
                                width = 0.2,
                            },
                        },
                    },
                }
            },
            lazygit = {
                enabled = true,
            },
        },
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
        opts = {
            exclude = {
                filetypes = {
                    "trouble",
                    "snacks_layout_box",
                    "snacks_picker_list",
                    "snacks_picker_input",
                },
            },
        },
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
}
