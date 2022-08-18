--vim.cmd [[packadd nvim-lspconfig]]
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil
---@diagnostic disable-next-line: param-type-mismatch
if vim.fn.empty(vim.fn.glob(install_path, nil, nil, nil)) > 0 then
    packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

----------------------------------------------
-- PLUGINS
----------------------------------------------
require('packer').startup(function(use)
    use "wbthomason/packer.nvim"

    if packer_bootstrap ~= nil then
        require('packer').sync()
    end
end)

vim.cmd("autocmd ColorScheme * hi Pmenu ctermbg=darkgrey guibg=#262b33, guifg=#9daaaa")
--vim.cmd("autocmd ColorScheme * hi Pmenu ctermbg=lightgrey guibg=#292f37 guifg=#9daaaa")
vim.cmd("autocmd ColorScheme * hi PmenuSel ctermbg=darkgrey ctermfg=lightblue guibg=#202020 guifg=#61afef")
vim.cmd("autocmd ColorScheme * hi Float guibg=#262b33")
vim.cmd("autocmd ColorScheme * hi FloatBorder guifg=#181818 guibg=#252a33")
vim.cmd("autocmd ColorScheme * hi TreesitterContext guibg=#383d48")

local border = {
    { "┏", "FloatBorder" },
    { "━", "FloatBorder" },
    { "┓", "FloatBorder" },
    { "┃", "FloatBorder" },
    { "┛", "FloatBorder" },
    { "━", "FloatBorder" },
    { "┗", "FloatBorder" },
    { "┃", "FloatBorder" },
    --
    --{ "┌", "FloatBorder" },
    --{ "─", "FloatBorder" },
    --{ "┐", "FloatBorder" },
    --{ "│", "FloatBorder" },
    --{ "┘", "FloatBorder" },
    --{ "─", "FloatBorder" },
    --{ "└", "FloatBorder" },
    --{ "│", "FloatBorder" },
    --
    --{ "╭", "FloatBorder" },
    --{ "─", "FloatBorder" },
    --{ "╮", "FloatBorder" },
    --{ "│", "FloatBorder" },
    --{ "╯", "FloatBorder" },
    --{ "─", "FloatBorder" },
    --{ "╰", "FloatBorder" },
    --{ "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("plugins")

----------------------------------------------
-- OPTIONS
----------------------------------------------

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.cmd("set colorcolumn=101")
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 2000
vim.o.timeoutlen = 2000
vim.cmd("set shortmess+=c")

vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.wildmenu = true
vim.cmd("set inccommand:nosplit")

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = {
        prefix = "",
    },
    update_in_insert = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "DiagnosticDefault" .. type })
end

----------------------------------------------
-- AUTOCOMMANDS
----------------------------------------------
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "*.clang-tidy", "*.clang-format", "*.clangd", "*.cmake-format", "*.cmake-lint" },
        callback = function()
            vim.cmd("setfiletype yaml")
        end,
    }
)
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "CMakeLists.txt", "CMakeLists.text", "*.cmake" },
        callback = function()
            vim.cmd("setfiletype cmake")
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = { "qf" },
        callback = function()
            vim.cmd("nnoremap <silent> <buffer> <CR> <CR>:cclose<CR>")
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = { "aerial" },
        callback = function()
            vim.cmd("set winhl=Normal:AerialNormal")
        end,
    }
)

vim.api.nvim_create_autocmd(
    "CursorHold",
    {
        pattern = { "*" },
        callback = function()
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, { focusable = false }
            )
            local cmp = require("cmp")
            if not cmp.visible() then
                vim.cmd("set eventignore=CursorHold")
                vim.lsp.buf.hover()
                vim.api.nvim_create_autocmd("CursorMoved",
                    {
                        pattern = { "*" },
                        once = true,
                        callback = function()
                            vim.cmd("set eventignore=\"\"")
                            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                                vim.lsp.handlers.hover, { focusable = true }
                            )
                        end
                    }
                )
            end
        end,
    }
)

----------------------------------------------
-- THEMEING
----------------------------------------------
vim.opt.termguicolors = true
vim.cmd("set background=dark")
vim.g.one_allow_italics = 1
vim.cmd("colorscheme one")
--vim.cmd("hi ColourColumn ctermbg=darkgrey guibg=#262b33 ctermfg=lightgrey guifg=#383d48")
vim.cmd("hi VertSplit ctermbg=darkgrey guibg=#262b33 ctermfg=lightgrey guifg=#383d48")
vim.cmd("hi VirtColumn guifg=#383d48")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

vim.cmd("hi DiagnosticSignError guifg=#c65156")
vim.cmd("hi DiagnosticSignWarn guifg=#d29767")
vim.cmd("hi DiagnosticSignHint guifg=#9daaaa")
vim.cmd("hi DiagnosticSignInfo guifg=#61afef")
vim.cmd("hi DiagnosticVirtualTextError guibg=#2d2d36 guifg=#c65156")
vim.cmd("hi DiagnosticVirtualTextWarn guibg=#2c2e33 guifg=#d29767")
vim.cmd("hi DiagnosticVirtualTextHint guibg=#292f37 guifg=#9daaaa")
vim.cmd("hi DiagnosticVirtualTextInfo guibg=#262d33 guifg=#61afef")

vim.cmd("hi BlameLineNvim guifg=#202020")
vim.cmd("hi GitSignsCurrentLineBlame guifg=#202020")
----------------------------------------------
-- HIGHLIGHTING FOR NVIM-TREE
----------------------------------------------

vim.cmd("hi Directory guibg=#23282e guifg=#61afef")
vim.cmd("hi NvimTreeNormal guibg=#23282e guifg=#9daaaa")
vim.cmd("hi NvimTreeCursorLine guibg=#383d48 guifg=#9daaaa")
vim.cmd("hi NvimTreeSymlink guibg=#23282e guifg=#dbba75")
vim.cmd("hi NvimTreeFolderName guibg=#23282e guifg=#61afef")
vim.cmd("hi NvimTreeEmptyFolderName guibg=#23282e guifg=#61afef")
vim.cmd("hi NvimTreeOpenedFolderName guibg=#23282e guifg=#61afef")
vim.cmd("hi NvimTreeFolderIcon guibg=#23282e guifg=#61afef")
vim.cmd("hi NvimTreeRootFolder guibg=#23282e guifg=#61afef")
vim.cmd("hi NvimTreeFileIcon guibg=#23282e guifg=#9daaaa")
vim.cmd("hi NvimTreeExecFile guibg=#23282e guifg=#9daaaa")
vim.cmd("hi NvimTreeOpenedFile guibg=#23282e guifg=#9daaaa")
vim.cmd("hi NvimTreeSpecialFile guibg=#23282e guifg=#9daaaa")
vim.cmd("hi NvimTreeImageFile guibg=#23282e guifg=#9daaaa")
vim.cmd("hi NvimTreeIndentMarker guibg=#23282e guifg=#9daaaa")

vim.cmd("hi LspDiagnosticsError guifg=#c65156")
vim.cmd("hi LspDiagnosticsWarn guifg=#d29767")
vim.cmd("hi LspDiagnosticsHint guifg=#9daaaa")
vim.cmd("hi LspDiagnosticsInformation guifg=#61afef")

vim.cmd("hi NvimTreeGitDirty guibg=#23282e guifg=#dbba75")
vim.cmd("hi NvimTreeGitStaged guibg=#23282e guifg=#83a76e")
vim.cmd("hi NvimTreeGitMerge guibg=#23282e guifg=#c67ada")
vim.cmd("hi NvimTreeGitRenamed guibg=#23282e guifg=#dbba75")
vim.cmd("hi NvimTreeGitNew guibg=#23282e guifg=#686e78")
vim.cmd("hi NvimTreeGitDeleted guibg=#23282e guifg=#c65156")

----------------------------------------------
-- HIGHLIGHTING FOR NVIM NOTIFY
----------------------------------------------
vim.cmd("hi NotifyERRORBorder guifg=#c65156")
vim.cmd("hi NotifyWARNBorder guifg=#dbba75")
vim.cmd("hi NotifyINFOBorder guifg=#61afef")
vim.cmd("hi NotifyDEBUGBorder guifg=#00997b")
vim.cmd("hi NotifyTRACEBorder guifg=#9daaaa")
vim.cmd("hi NotifyERRORIcon guifg=#c65156")
vim.cmd("hi NotifyWARNIcon guifg=#dbba75")
vim.cmd("hi NotifyINFOIcon guifg=#61afef")
vim.cmd("hi NotifyDEBUGIcon guifg=#00997b")
vim.cmd("hi NotifyTRACEIcon guifg=#9daaaa")
vim.cmd("hi NotifyERRORTitle guifg=#c65156")
vim.cmd("hi NotifyWARNTitle guifg=#dbba75")
vim.cmd("hi NotifyINFOTitle guifg=#61afef")
vim.cmd("hi NotifyDEBUGTitle guifg=#00997b")
vim.cmd("hi NotifyTRACETitle guifg=#9daaaa")
vim.cmd("hi! link NotifyERRORBody Normal")
vim.cmd("hi! link NotifyWARNBody Normal")
vim.cmd("hi! link NotifyINFOBody Normal")
vim.cmd("hi! link NotifyDEBUGBody Normal")
vim.cmd("hi! link NotifyTRACEBody Normal")

----------------------------------------------
-- HIGHLIGHTING FOR NVIM CMP
----------------------------------------------

vim.cmd("hi CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
vim.cmd("hi CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
vim.cmd("hi CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6")
vim.cmd("hi CmpItemMenu guibg=None guifg=#c67ada gui=italic cterm=italic")

vim.cmd("hi CmpItemKindText guifg=#202020 guibg=#9daaaa")
vim.cmd("hi! link CmpItemKindVariable CmpItemKindText")
vim.cmd("hi! link CmpItemKindSnippet CmpItemKindText")
vim.cmd("hi! link CmpItemKindConstant CmpItemKindText")

--vim.cmd("hi CmpItemKindClass guibg=NONE guifg=#dbba75")
vim.cmd("hi CmpItemKindType guifg=#202020 guibg=#dbba75")
vim.cmd("hi! link CmpItemKindClass CmpItemKindType")
vim.cmd("hi! link CmpItemKindConstructor CmpItemKindType")
vim.cmd("hi! link CmpItemKindInterface CmpItemKindType")
vim.cmd("hi! link CmpItemKindEnum CmpItemKindType")
vim.cmd("hi! link CmpItemKindStruct CmpItemKindType")
vim.cmd("hi! link CmpItemKindEvent CmpItemKindType")

--vim.cmd("hi CmpItemKindValue guibg=NONE guifg=#d29767")
vim.cmd("hi CmpItemKindValue guifg=#202020 guibg=#d29767")
vim.cmd("hi! link CmpItemKindNumber CmpItemKindValue")

--vim.cmd("hi CmpItemKindFunction guibg=NONE guifg=#61afef")
vim.cmd("hi CmpItemKindFunction guifg=#202020 guibg=#61afef")
vim.cmd("hi! link CmpItemKindMethod CmpItemKindFunction")
vim.cmd("hi! link CmpItemKindOperator CmpItemKindFunction")

--vim.cmd("hi CmpItemKindKeyword guibg=NONE guifg=#c67ada")
vim.cmd("hi CmpItemKindKeyword guifg=#202020 guibg=#c67ada")
vim.cmd("hi! link CmpItemKindObject CmpItemKindKeyword")
vim.cmd("hi! link CmpItemKindTag CmpItemKindKeyword")
vim.cmd("hi! link CmpItemKindBoolean CmpItemKindKeyword")

--vim.cmd("hi CmpItemKindProperty guibg=NONE guifg=#c65156")
vim.cmd("hi CmpItemKindProperty guifg=#202020 guibg=#c65156")
vim.cmd("hi! link CmpItemKindField CmpItemKindProperty")

--vim.cmd("hi CmpItemKindModule guibg=NONE guifg=#00997b")
vim.cmd("hi CmpItemKindModule guifg=#202020 guibg=#00997b")
vim.cmd("hi! link CmpItemKindUnit CmpItemKindModule")
vim.cmd("hi! link CmpItemKindEnumMember CmpItemKindModule")
vim.cmd("hi! link CmpItemKindTypeParameter CmpItemKindModule")

--vim.cmd("hi CmpItemKindString guibg=NONE guifg=#83a76e")
vim.cmd("hi CmpItemKindString guifg=#202020 guibg=#83a76e")
vim.cmd("hi! link CmpItemKindCalendar CmpItemKindString")
vim.cmd("hi! link CmpItemKindWatch CmpItemKindString")

----------------------------------------------
-- GENERIC HIGHLIGHTING
----------------------------------------------
vim.cmd("hi Type ctermfg=29 guifg=#dbba75 cterm=none gui=none")
vim.cmd("hi Macro guifg=#9c80ff cterm=none gui=none")
vim.cmd("hi Function guifg=#61afef cterm=none gui=none")
vim.cmd("hi Keyword guifg=#c67ada cterm=none gui=none")
vim.cmd("hi Comment guifg=#686e78 cterm=none gui=none")
vim.cmd("hi String guifg=#83a76e cterm=none gui=none")
vim.cmd("hi Number guifg=#d29767 cterm=none gui=none")
vim.cmd("hi Normal ctermbg=darkgrey guibg=#262b33 guifg=#9daaaa cterm=none gui=none")
vim.cmd("hi Variable guifg=#9daaaa cterm=none gui=none")
vim.cmd("hi Field guifg=#c65156 cterm=none gui=none")
vim.cmd("hi Property guifg=#c65156 cterm=none gui=none")
vim.cmd("hi Namespace guifg=#00997b cterm=italic gui=italic")

----------------------------------------------
-- C/CPP HIGHLIGHTING
----------------------------------------------
vim.g.cpp_attributes_hi = 1
vim.g.cpp_member_hi = 1

vim.cmd("hi! link CUserFunction Macro")
vim.cmd("hi! link cppAttribute Normal")
vim.cmd("hi! link CStructMember Property")

vim.g.cpp_class_scope_hi = 1
vim.g.cpp_member_variable_hi = 1
vim.g.cpp_lcass_decl_hi = 1
vim.g.cpp_posix_standard = 1
vim.g.cpp_experimential_template_hi = 1
vim.g.cpp_concepts_hi = 1

vim.cmd("hi! link cCustomFunc Function")
vim.cmd("hi! link CCustomMemVar Property")
vim.cmd("hi! link cppSTLnamespace Namespace")
vim.cmd("hi! link cppSTLType Type")
vim.cmd("hi! link cppSTLtype Type")
vim.cmd("hi! link cppSTLFunction Normal")
vim.cmd("hi! link cppSTLfunction Normal")
vim.cmd("hi! link cppCast Keyword")
vim.cmd("hi! link cppAccess Keyword")
vim.cmd("hi! link cCustomClass Namespace")

----------------------------------------------------
-- CPP SEMANTIC HIGHLIGHTING
----------------------------------------------------

vim.cmd("hi LspCxxHlGroupEnumConstant ctermfg=3 guifg=#00997b cterm=none gui=none")
vim.cmd("hi LspCxxHlGroupNamespace ctermfg=3 guifg=#00997b cterm=italic gui=italic")
vim.cmd("hi LspCxxHlGroupMemberVariable ctermfg=88 guifg=#c65156 cterm=none gui=none")
vim.cmd("hi LspCxxHlSymUnknownStaticField ctermfg=88 guifg=#c65156 cterm=bold gui=bold")
vim.cmd("hi LspCxxHlSymDependentType ctermfg=3 guifg=#00997b cterm=none gui=none")
vim.cmd("hi LspCxxHlSymTypeAlias ctermfg=29 guifg=#dbba75 cterm=none gui=none")
vim.cmd("hi LspCxxhlSymTypeParameter ctermfg=3 guifg=#00997b cterm=bold gui=bold")
vim.cmd("hi LspCxxHlSymTemplateParameter ctermfg=3 guifg=#00997b cterm=bold gui=bold")
vim.cmd("hi LspCxxHlSymVariable ctermfg=white guifg=#9daaaa cterm=none gui=none")
vim.cmd("hi LspCxxHlSymParameter ctermfg=white guifg=#6090a4 cterm=none gui=none")
vim.cmd("hi LspCxxHlSkippedRegion ctermfg=lightgrey ctermbg=darkgrey guifg=#444444 guibg=#202020")
vim.cmd("hi LspCxxHlSkippedRegionBeginEnd ctermfg=lightgrey ctermbg=darkgrey guifg=#444444 guibg=#202020")

vim.cmd("hi! link cInclude Keyword")
vim.cmd("hi cStructMember guifg=#c65156")
--vim.cmd("hi cCommentL guifg=#9c80ff")
vim.cmd("hi cppSTLConcept guifg=#dbba75")
vim.cmd("hi Delimiter guifg=#9daaaa")
vim.cmd("hi TSParameter guifg=#6090a4")
vim.cmd("hi TSParameterReference guifg=#6090a4")
vim.cmd("hi TSConstructor guifg=#dbba75")
vim.cmd("hi Identifier guifg=#9daaaa")
vim.cmd("hi TSField guifg=#c65156")
vim.cmd("hi TSProperty guifg=#c65156")
vim.cmd("hi TSAnnotation guifg=#9c80ff")
vim.cmd("hi TSAttribute guifg=#9daaaa")
vim.cmd("hi! link TSNamespace Namespace")
vim.cmd("hi TSPreProc guifg=#c67ada")
vim.cmd("hi TSStorageClass guifg=#c67ada")
vim.cmd("hi! link TSType Type")
vim.cmd("hi! link TSBuiltinType Keyword")
vim.cmd("hi! link TSTypeBuiltin Keyword")
vim.cmd("hi TSTypeDefinition guifg=#dbaa75")
vim.cmd("hi TSInclude guifg=#c67ada")
vim.cmd("hi! link TSMethod Function")
vim.cmd("hi! link TSFunction Function")
vim.cmd("hi! link TSBuiltinMethod Keyword")
vim.cmd("hi! link TSBuiltinFunction Keyword")
vim.cmd("hi! link TSMethodBuiltin Keyword")
vim.cmd("hi! link TSFunctionBuiltin Keyword")
vim.cmd("hi TSDefine guifg=#9c80ff")
vim.cmd("hi cDefine guifg=#9c80ff")
vim.cmd("hi Define guifg=#9c80ff")
vim.cmd("hi PreProc guifg=#9c80ff")
vim.cmd("hi TSNote guifg=#9c80ff")
vim.cmd("hi TSLiteral guifg=#9daaaa")
vim.cmd("hi TSTag guifg=#9c80ff")
vim.cmd("hi TSLabel guifg=#9c80ff")
vim.cmd("hi TSTagAttribute guifg=#9daaaa")
vim.cmd("hi TSConstant guifg=#9daaaa")
vim.cmd("hi TSConstMacro guifg=#9c80ff")
vim.cmd("hi TSTitle guifg=#9daaaa")
vim.cmd("hi Operator guifg=#9daaaa")

vim.cmd("hi! link LspSemantic_attribute Define")
vim.cmd("hi! link LspSemantic_enum Type")
vim.cmd("hi! link LspSemantic_function Function")
vim.cmd("hi! link LspSemantic_derive Define")
vim.cmd("hi! link LspSemantic_macro PreProc")
vim.cmd("hi! link LspSemantic_method Function")
vim.cmd("hi! link LspSemantic_namespace Namespace")
vim.cmd("hi! link LspSemantic_struct Type")
vim.cmd("hi! link LspSemantic_concept Type")
vim.cmd("hi! link LspSemantic_trait Type")
vim.cmd("hi! link LspSemantic_interface Type")
vim.cmd("hi! link LspSemantic_typeAlias Type")
vim.cmd("hi! link LspSemantic_constructor Type")
vim.cmd("hi! link LspSemantic_class Type")
vim.cmd("hi! link LspSemantic_union Type")
vim.cmd("hi! link LspSemantic_typeAlias Type")
vim.cmd("hi! link LspSemantic_typedef Type")

vim.cmd("hi! link LspSemantic_boolean Boolean")
vim.cmd("hi! link LspSemantic_character Character")
vim.cmd("hi! link LspSemantic_number Number")
vim.cmd("hi! link LspSemantic_string String")
vim.cmd("hi! link LspSemantic_escapeSequence Special")
vim.cmd("hi! link LspSemantic_formatSpecifier Operator")

vim.cmd("hi! link LspSemantic_operator Operator")
vim.cmd("hi! link LspSemantic_arithmetic Operator")
vim.cmd("hi! link LspSemantic_bitwise Operator")
vim.cmd("hi! link LspSemantic_comparison Operator")
vim.cmd("hi! link LspSemantic_logical Operator")

vim.cmd("hi! link LspSemantic_punctuation Operator")
vim.cmd("hi! link LspSemantic_attributeBracket Operator")
vim.cmd("hi! link LspSemantic_angle Operator")
vim.cmd("hi! link LspSemantic_brace Operator")
vim.cmd("hi! link LspSemantic_bracket Operator")
vim.cmd("hi! link LspSemantic_parenthesis Operator")
vim.cmd("hi! link LspSemantic_colon Operator")
vim.cmd("hi! link LspSemantic_comma Operator")
vim.cmd("hi! link LspSemantic_dot Operator")
vim.cmd("hi! link LspSemantic_semi Operator")
vim.cmd("hi! link LspSemantic_macroBang PreProc")

vim.cmd("hi! link LspSemantic_builtinAttribute Keyword")
vim.cmd("hi! link LspSemantic_builtinType Keyword")
vim.cmd("hi! link LspSemantic_builtinFunction Keyword")
vim.cmd("hi! link LspSemantic_builtinVariable Keyword")
vim.cmd("hi! link LspSemantic_builtin Keyword")
vim.cmd("hi! link LspSemantic_comment Comment")
vim.cmd("hi! link LspSemantic_constParameter Parameter")
vim.cmd("hi LspSemantic_enumMember guifg=#00997b")
-- vim.(" [[hi link LspSemantic_generic Variable")
vim.cmd("hi! link LspSemantic_keyword Keyword")
vim.cmd("hi! link LspSemantic_label Label")
vim.cmd("hi! link LspSemantic_lifetime Property")
vim.cmd("hi! link LspSemantic_parameter Parameter")
vim.cmd("hi! link LspSemantic_parameterReference Parameter")
--vim.cmd("hi LspSemantic_usedAsMutableReference guifg=#6090a4")
vim.cmd("hi! link LspSemantic_usedAsMutableReference Normal")
vim.cmd("hi! link LspSemantic_property Property")
vim.cmd("hi! link LspSemantic_field Property")
vim.cmd("hi! link LspSemantic_member Property")
vim.cmd("hi! link LspSemantic_structMember Property")
vim.cmd("hi LspSemantic_staticProperty guifg=#c65156 gui=bold cterm=bold")
vim.cmd("hi! link LspSemantic_selfKeyword Keyword")
vim.cmd("hi! link LspSemantic_thisKeyword Keyword")
-- vim.cmd("hi link LspSemantic_toolModule  ")
vim.cmd("hi LspSemantic_typeParameter guifg=#00997b")
-- vim.cmd("hi link LspSemantic_unresolvedReference Unresolved")
--vim.cmd("hi! link LspSemantic_variable Variable")
vim.cmd("hi LspSemantic_static gui=bold")

vim.cmd("hi LspReferenceText cterm=underline gui=underline")
vim.cmd("hi LspReferenceRead cterm=underline gui=underline")
vim.cmd("hi LspReferenceWrite cterm=underline gui=underline")

----------------------------------------------
-- DOXYGEN HIGHLIGHTING
----------------------------------------------
vim.g.load_doxygen_syntax = 1
vim.cmd("hi! link doxygenBriefLine doxygenComment")
vim.cmd("hi! link doxygenBrief doxygenComment")
vim.cmd("hi! link doxygenSpecialMultilineDesc doxygenComment")
vim.cmd("hi! link doxygenSpecialOnelineDesc doxygenComment")
vim.cmd("hi doxygenParamName ctermfg=88 guifg=#a04146 cterm=italic gui=italic")
vim.cmd("hi doxygenParam guifg=#8278b4 cterm=italic,bold gui=italic,bold")
vim.cmd("hi doxygenSpecial guifg=#8278b4 cterm=italic,bold gui=italic,bold")

----------------------------------------------
-- AERIAL.NVIM HIGHLIGHTING
----------------------------------------------
vim.cmd("hi  AerialFile guibg=#23282e guifg=#00997b")
vim.cmd("hi! link AerialFileIcon AerialFile")
vim.cmd("hi AerialNamespace guibg=#23282e guifg=#00997b")
vim.cmd("hi! link AerialNamespaceIcon AerialNamespace")
vim.cmd("hi! link AerialModule AerialNamespace")
vim.cmd("hi! link AerialModuleIcon AerialNamespace")
vim.cmd("hi! link AerialPackage AerialNamespace")
vim.cmd("hi! link AerialPackageIcon AerialNamespace")

vim.cmd("hi AerialClass guibg=#23282e guifg=#dbba75")
vim.cmd("hi! link AerialClassIcon AerialType")
vim.cmd("hi! link AerialConstructor AerialType")
vim.cmd("hi! link AerialConstructorIcon AerialType")
vim.cmd("hi! link AerialInterface AerialType")
vim.cmd("hi! link AerialInterfaceIcon AerialType")
vim.cmd("hi! link AerialStruct AerialType")
vim.cmd("hi! link AerialStructIcon AerialType")
vim.cmd("hi! link AerialEvent AerialType")
vim.cmd("hi! link AerialEventIcon AerialType")
vim.cmd("hi! link AerialEnum AerialType")
vim.cmd("hi! link AerialEnumIcon AerialType")

vim.cmd("hi AerialFunction guibg=#23282e guifg=#61afef")
vim.cmd("hi! link AerialFunctionIcon AerialFunction")
vim.cmd("hi! link AerialMethod AerialFunction")
vim.cmd("hi! link AerialMethodIcon AerialFunction")

vim.cmd("hi AerialProperty guibg=#23282e guifg=#c65156")
vim.cmd("hi! link AerialPropertyIcon AerialProperty")
vim.cmd("hi! link AerialField AerialProperty")
vim.cmd("hi! link AerialFieldIcon AerialProperty")


vim.cmd("hi AerialVariable guibg=#23282e guifg=#9daaaa")
vim.cmd("hi! link AerialVariableIcon AerialVariable")
vim.cmd("hi! link AerialConstant AerialVariable")
vim.cmd("hi! link AerialConstantIcon AerialVariable")
vim.cmd("hi! link AerialArray AerialVariable")
vim.cmd("hi! link AerialArrayIcon AerialVariable")
vim.cmd("hi! link AerialObject AerialVariable")
vim.cmd("hi! link AerialObjectIcon AerialVariable")
vim.cmd("hi! link AerialOperator AerialVariable")
vim.cmd("hi! link AerialOperatorIcon AerialVariable")

vim.cmd("hi AerialString guibg=#23282e guifg=#83a76e")
vim.cmd("hi! link AerialStringIcon AerialString")
vim.cmd("hi! link AerialKey AerialString")
vim.cmd("hi! link AerialKeyIcon AerialString")

vim.cmd("hi AerialNumber guibg=#23282e guifg=#d29767")
vim.cmd("hi! link AerialNumberIcon AerialNumber")

vim.cmd("hi AerialBoolean guibg=#23282e guifg=#c67ada")
vim.cmd("hi! link AerialBooleanIcon AerialKeyword")
vim.cmd("hi! link AerialNull AerialKeyword")
vim.cmd("hi! link AerialNullIcon AerialKeyword")

vim.cmd("hi! link AerialEnumMember AerialNamespace")
vim.cmd("hi! link AerialEnumMemberIcon AerialNamespace")
vim.cmd("hi! link AerialTypeParameter AerialNamespace")
vim.cmd("hi! link AerialTypeParameterIcon AerialNamespace")

vim.cmd("hi AerialGuide guibg=#23282e guifg=#686e78")
vim.cmd("hi AerialNormal guibg=#23282e guifg=#9daaaa")

----------------------------------------------
-- KEYMAPS
----------------------------------------------

local function map(mode, lhs, rhs, description, opts)
    local options = {
        noremap = true,
        silent = true
    }
    if opts then
        ---@diagnostic disable-next-line: cast-local-type
        options = vim.tbl_extend("force", options, opts)
    end
    local wk_options = {
        mode = mode,
        prefix = "",
        buffer = nil,
        ---@diagnostic disable-next-line: need-check-nil
        noremap = options.noremap,
        ---@diagnostic disable-next-line: need-check-nil
        silent = options.silent,
    }
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    local wk = require("which-key")
    wk.register({
        [lhs] = {
            rhs,
            description,
        },
    }, wk_options)

    if mode ~= "t" then
        local command_center = require("command_center")
        command_center.add({
            {
                desc = description,
                cmd = rhs,
                keys = { mode, lhs, options },
                mode = command_center.mode.ADD,
            }
        }, { command_center.mode.ADD })
    end
end

local function nmap(lhs, rhs, description, options)
    map("n", lhs, rhs, description, options)
end

local function tmap(lhs, rhs, description, options)
    map("t", lhs, rhs, description, options)
end

vim.g.mapleader = ' '
nmap("<A-S-p>", "<cmd>Telescope command_center<CR>", "Open Command Center")
nmap("<S-f>", "<cmd>lua require(\"telescope.builtin\").find_files(require(\"telescope.themes\").get_dropdown({}))<CR>",
    "Telescope Find Files")
nmap("<S-A-g>", "<cmd>lua require(\"telescope.builtin\").live_grep(require(\"telescope.themes\").get_dropdown({}))<CR>",
    "Telescope Live Grep")
nmap("<C-t>", "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree")
nmap("<S-D>", "<cmd>Dox<CR>", "Create a Doxygen Comment")
nmap("<C-p>", "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer")
nmap("<C-n>", "<cmd>BufferLineCycleNext<CR>", "Next Buffer")
nmap("<C-m><C-p>", "<cmd>BufferLineMovePrev<CR>", "Move Buffer Back One")
nmap("<C-m><C-n>", "<cmd>BufferLineMoveNext<CR>", "Move Buffer Forward One")
nmap("<C-c>", "<cmd>Bdelete<CR>", "Delete Current Buffer")
nmap("<C-s>", "<cmd>vsplit<CR>", "Vertical Split")
nmap("s", "", "")
nmap("<leader>s", "<cmd>vsplit<CR>", "Vertical Split")

vim.cmd("map <A-CR>=^[^M", "")
nmap("<A-h>", "0", "Go to Start of Line")
nmap("<A-l>", "$", "Go to End of Line")

nmap("<S-h>", "<C-w><C-h>", "Go to Left Window")
nmap("<S-l>", "<C-w><C-l>", "Go to Right Window")
nmap("<S-k>", "<C-w><C-k>", "Go to Top Window")
nmap("<S-j>", "<C-w><C-j>", "Go to Bottom Window")
nmap("<C-Left>", "<C-w><C-h>", "Go to Left Window")
nmap("<C-Right>", "<C-w><C-l>", "Go to Right Window")
nmap("<C-Up>", "<C-w><C-k>", "Go to Top Window")
nmap("<C-Down>", "<C-w><C-j>", "Go to Bottom Window")

nmap("<C-l>", "<cmd>Trouble document_diagnostics<CR>", "Show Diagnostics")
nmap("<C-l><C-k>", "<cmd>TroubleClose<CR>", "Close Diagnostics")

nmap("<S-t>", "<cmd>lua require(\"nvterm.terminal\").toggle \"horizontal\"<CR>", "Open NvTerm")
nmap("<T>", "<cmd>lua require(\"nvterm.terminal\").toggle \"horizontal\"<CR>", "Open NvTerm")
nmap("<C-S-t>", "<cmd>lua require(\"nvterm.terminal\").toggle \"float\"<CR>", "Open NvTerm in float")

tmap("<S-t>", "<cmd>lua require(\"nvterm.terminal\").toggle \"horizontal\"<CR>", "Close NvTerm")
tmap("<T>", "<cmd>lua require(\"nvterm.terminal\").toggle \"horizontal\"<CR>", "Close NvTerm")
tmap("<C-S-t>", "<cmd>lua require(\"nvterm.terminal\").toggle \"float\"<CR>", "Close NvTerm")

nmap("<S-A-d>", "<cmd>lua package.loaded.gitsigns.diffthis()<CR>", "Show git diff for file")
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Defintion")
nmap("gc", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration")
nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation")
nmap("<C-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", "Open Documentation Hover")
nmap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
nmap("<Leader>rn", "<cmd>lua require(\"cosmic-ui\").rename()<CR>", "Rename")
nmap("<A-CR>", "<cmd>lua require(\"cosmic-ui\").code_actions()<CR>", "Code Actions")
nmap("<S-c>", "<cmd>lua require(\"cosmic-ui\").code_actions()<CR>", "Code Actions")
nmap("<C-A-l>", "<cmd>lua vim.lsp.buf.format {async = true}<CR>", "Format Document")

nmap("<C-d>", "<cmd>lua vim.diagnostic.config({virtual_lines = { prefix = \"🔥\"}})<CR>", "Show Diagnostic Text")
nmap("<C-S-d>", "<cmd>lua vim.diagnostic.config({virtual_lines = false})<CR>", "Hide Diagnostic Text")

nmap("<S-m>", "<cmd>AerialToggle!<CR>", "Toggles the Aerial Overview")

nmap("<F10>",
    ":echo \"hi<\" . synIDattr(synID(line(\".\"),col(\".\"),1),\"name\") . '> trans<'\
				. synIDattr(synID(line(\".\"),col(\".\"),0),\"name\") . \"> lo<\"\
				. synIDattr(synIDtrans(synID(line(\".\"),col(\".\"),1)),\"name\") . \">\"<CR>",
    "Show Highlight Group For Token"
)
