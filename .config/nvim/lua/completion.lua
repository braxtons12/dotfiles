local border = require("ui.border").with_hl_group

return {
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = {
            "InsertEnter",
            "CmdLineEnter"
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "hrsh7th/cmp-nvim-lsp",
                lazy = true,
                cond = function()
                    local has_lspconfig, _ = pcall(require, "lspconfig")
                    return has_lspconfig
                end
            },
            {
                "hrsh7th/cmp-nvim-lsp-document-symbol",
                lazy = true,
                cond = function()
                    local has_lspconfig, _ = pcall(require, "lspconfig")
                    return has_lspconfig
                end
            },
            {
                "hrsh7th/cmp-buffer",
                lazy = true,
            },
            {
                "hrsh7th/cmp-path",
                lazy = true,
            },
            {
                "hrsh7th/cmp-git",
                lazy = true,
                cond = function()
                    return vim.fn.isdirectory(".git/index")
                end
            },
            {
                "hrsh7th/cmp-cmdline",
                lazy = true,
            },
            {
                "hrsh7th/cmp-nvim-lua",
                lazy = true,
                ft = {
                    "lua",
                },
            },
            {
                "tamago324/cmp-zsh",
                lazy = true,
                ft = {
                    "*.zshrc",
                    ".zshrc",
                    "zsh",
                    "sh",
                    "*.bashrc",
                    ".bashrc",
                    "bash",
                },
                opts = {
                    zshrc = true,
                },
            },
            {
                "Saecki/crates.nvim",
                lazy = true,
                ft = {
                    "toml",
                },
            },
            {
                "hrsh7th/cmp-vsnip",
                lazy = true,
                dependencies = {
                    {
                        "hrsh7th/vim-vsnip",
                        lazy = true,
                    },
                },
            },
            --{
            --    "tzachar/cmp-fuzzy-path",
            --    lazy = true,
            --    dependencies = "tzachar/fuzzy.nvim",
            --},
        },
        config = function(_, _)
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local feedkey = function(key, mode)
                ---@diagnostic disable-next-line: param-type-mismatch
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
            end

            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                window = {
                    completion = {
                        border = border,
                        col_offset = -3,
                        side_padding = 0,
                        winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
                    },
                    documentation = {
                        winhighlight = "Normal:Float,FloatBorder:FloatBorder",
                        border = border,
                    },
                },
                formatting = {
                    expandable_indicator = true,
                    fields = {
                        "kind",
                        "abbr",
                        "menu",
                    },
                    format = function(_, vim_item)
                        local icons = require("lspkind_icons")
                        local icon = icons[vim_item.kind]
                        local menu = vim_item.kind
                        vim_item.kind = " " .. icon
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
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.score,
                        cmp.config.compare.locality,
                        cmp.config.compare.recently_used,
                        require("clangd_extensions.cmp_scores"),
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
                        {
                            name = "lazydev",
                        },
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
                    priority_weight = 2,
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
                    priority_weight = 2,
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
                    priority_weight = 2,
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
                    --{ name = "fuzzy_path" },
                    { name = "cmdline" },
                }),
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.score,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.offset,
                    }
                },
            })
        end
    },
}
