----------------------------------------------
-- OVERRIDE BUILT-IN FLOATING WINDOW BORDER
----------------------------------------------

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    local border = {
        { "┏", "FloatBorder" },
        { "━", "FloatBorder" },
        { "┓", "FloatBorder" },
        { "┃", "FloatBorder" },
        { "┛", "FloatBorder" },
        { "━", "FloatBorder" },
        { "┗", "FloatBorder" },
        { "┃", "FloatBorder" },
    }

    opts = opts or {}
    opts.border = border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

----------------------------------------------
-- REGISTER SEMANTIC TOKEN HIGHLIGHTING HANDLER
----------------------------------------------

local function handler(err, response, ctx, config)
    local function get_bit(n, k)
        if _G.bit then
            return _G.bit.band(_G.bit.rshift(n, k), 1)
        else
            return math.floor((n / math.pow(2, k)) % 2)
        end
    end

    local function modifiers_from_number(x, modifiers_table)
        local modifiers = {}
        for i = 0, #modifiers_table - 1 do
            local bit = get_bit(x, i)
            if bit == 1 then
                table.insert(modifiers, 1, modifiers_table[i + 1])
            end
        end
        return modifiers
    end

    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then
        return
    end
    local legend = client.server_capabilities.semanticTokensProvider.legend
    local token_types = legend.tokenTypes
    local token_modifiers = legend.tokenModifiers
    local data = response.data

    local line
    local start_char = 0
    for i = 1, #data, 5 do
        local delta_line = data[i]
        line = line and line + delta_line or delta_line
        local delta_start = data[i + 1]
        start_char = delta_line == 0 and start_char + delta_start or delta_start
        local token_type = token_types[data[i + 3] + 1]
        local modifiers = modifiers_from_number(data[i + 4], token_modifiers)

        local token = {
            line = line,
            start_char = start_char,
            length = data[i + 2],
            type = token_type,
            modifiers = modifiers,
            offset_encoding = client.offset_encoding,
        }

        local line, col = unpack(config.cursor)
        if token.line == line - 1 then
            if token.start_char <= col and col <= token.start_char + token.length then
                local mods = ""
                for mod = 1, #token.modifiers do
                    mods = mods .. token.modifiers[mod] .. ", "
                end
                vim.notify(token.type .. "\nmods: " .. mods, vim.log.levels.ERROR)
            end
        end
    end
end

local function semantic_token_under_cursor()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local params = { textDocument = require("vim.lsp.util").make_text_document_params() }
    local h = vim.lsp.with(handler, { cursor = cursor })
    vim.lsp.buf_request(0, "textDocument/semanticTokens/full", params, h)
end

vim.api.nvim_create_user_command("SemanticTokenUnderCursor", semantic_token_under_cursor, {})

vim.opt.termguicolors = true
return require("ui.plugins")

