local border = require('ui.border').with_hl_group
local has_words_before = function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
      return false
    end
    local line = vim.api.nvim_get_current_line()
    return line:sub(col, col):match("%s") == nil
end

local select_next = function(cmp)
    if has_words_before() then
        return cmp.insert_next()
    end
end

local select_prev = function(cmp)
    if has_words_before() then
        return cmp.insert_prev()
    end
end

return {
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets',
            'xzbdmw/colorful-menu.nvim',
        },
        version = '1.*',
        lazy = true,
        event = {
            'InsertEnter',
            'CmdLineEnter',
        },
        opts = {
            keymap = {
                ['<Up>'] = {
                    select_prev,
                    'fallback',
                },
                ['<Down>'] = {
                    select_next,
                    'fallback',
                },
                ['<CR>'] = {
                    function(cmp)
                        return cmp.accept()
                    end,
                    'fallback',
                },
                ['<S-Tab>'] = {
                    select_prev,
                    'fallback',
                },
                ['<Tab>'] = {
                    select_next,
                    'fallback',
                },
            },
            appearance = {
                nerd_font_variant = 'mono',
                kind_icons = require('lspkind_icons'),
                --use_nvim_cmp_as_default = true,
            },
            cmdline = {
                enabled = true,
            },
            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
                menu = {
                    auto_show = true,
                    draw = {
                        columns = {
                            {
                                'kind_icon',
                                gap = 1,
                            },
                            {
                                'label',
                                gap = 1,
                            },
                        },
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx)
                                    return ctx.kind_icon .. ctx.icon_gap
                                end,
                                highlight = function(ctx)
                                    return ctx.kind_hl
                                end
                            },
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                        },
                        treesitter = {
                            'lsp',
                        }
                    },
                    border = 'none',
                    winblend = 1,
                    winhighlight = 'EndOfBuffer:FloatNormal',
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 250,
                    window = {
                        border = border,
                        winblend = 1,
                        winhighlight = 'EndOfBuffer:FloatNormal',
                    },
                },
                ghost_text = {
                    enabled = true,
                    show_with_menu = true,
                },
                trigger = {
                    show_on_keyword =  true,
                    show_on_trigger_character = true,
                    show_on_insert_on_trigger_character = true,
                },
            },
            sources = {
                default = {
                    'lsp',
                    'path',
                    'snippets',
                    'buffer',
                },
            },
            fuzzy = {
                implementation = 'prefer_rust',
            },
            signature = {
                enabled = false,
                window = {
                    show_documentation = true,
                    border = border,
                    winblend = 1,
                    winhighlight = 'EndOfBuffer:FloatNormal',
                    direction_priority = {
                        'e'
                    }
                },
            },
        },
        opts_extend = {
            'sources.default',
        },
    },
}
