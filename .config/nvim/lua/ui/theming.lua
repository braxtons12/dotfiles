vim.api.nvim_create_autocmd(
    {
        "ColorScheme"
    },
    {
        pattern = "*",
        callback = function()
            vim.cmd("hi Pmenu ctermbg=darkgrey guibg=#262b33 guifg=#9daaaa")
            vim.cmd("hi PmenuSel ctermbg=darkgrey ctermfg=lightblue guibg=#202020 guifg=#61afef")
            vim.cmd("hi Float guibg=#262b33")
            vim.cmd("hi NormalFloat guibg=#262b33")
            vim.cmd("hi FloatBorder guifg=#181818 guibg=#252a33")
            vim.cmd("hi NoiceBorder guifg=#61afef guibg=#252a33")
            vim.cmd("hi TreesitterContext guibg=#383d48")
        end
    })

vim.cmd("set background=dark")
vim.g.one_allow_italics = 1
--vim.cmd("colorscheme one")
--vim.cmd("hi ColourColumn ctermbg=darkgrey guibg=#262b33 ctermfg=lightgrey guifg=#383d48")
vim.cmd("hi VertSplit ctermbg=darkgrey guibg=#262b33 ctermfg=lightgrey guifg=#383d48")
vim.cmd("hi VirtColumn guifg=#383d48")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

----------------------------------------------
-- BASIC DIAG/INFO HIGHLIGHTING
----------------------------------------------

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

vim.cmd("hi DiffAdd guifg=#83a76e guibg=#23272e")
vim.cmd("hi DiffChange guifg=#61afef guibg=#23272e")
vim.cmd("hi DiffDelete guifg=#c65156 guibg=#23272e")

----------------------------------------------
-- BASIC HIGHLIGHTING
----------------------------------------------

vim.cmd("hi Type ctermfg=29 guifg=#dbba75 cterm=none gui=none")
vim.cmd("hi Macro guifg=#9c80ff cterm=none gui=none")
vim.cmd("hi Function guifg=#61afef cterm=none gui=none")
vim.cmd("hi Keyword guifg=#c67ada cterm=none gui=none")
vim.cmd("hi Comment guifg=#686e78 cterm=none gui=none")
vim.cmd("hi String guifg=#83a76e cterm=none gui=none")
vim.cmd("hi Number guifg=#d29767 cterm=none gui=none")
vim.cmd("hi Normal ctermbg=darkgrey guibg=#262b33 guifg=#9daaaa cterm=none gui=none")
--vim.cmd("hi NormalNC ctermbg=darkgray guibg=#262b33 guifg=#9daaaa cterm=none gui=none")
vim.cmd("hi Variable guifg=#9daaaa cterm=none gui=none")
vim.cmd("hi Field guifg=#c65156 cterm=none gui=none")
vim.cmd("hi Property guifg=#c65156 cterm=none gui=none")
vim.cmd("hi Namespace guifg=#00997b cterm=italic gui=italic")
vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
--vim.cmd("hi EndOfBuffer guibg=#262b33 guifg=#262b33")
vim.cmd("hi Delimiter guifg=#9daaaa")
vim.cmd("hi Identifier guifg=#9daaaa")
vim.cmd("hi Define guifg=#9c80ff")
vim.cmd("hi PreProc guifg=#9c80ff")
vim.cmd("hi Operator guifg=#9daaaa")
vim.cmd("hi Parameter guifg=#588496")

----------------------------------------------
-- HIGHLIGHTING FOR DAP-UI
----------------------------------------------

vim.cmd("hi! link DapUIType Type")
vim.cmd("hi! link DapUIValue Number")
vim.cmd("hi! link DapUIModifiedValue Field")
vim.cmd("hi! link DapUIScope Namespace")
vim.cmd("hi! link DapUIDecoration Macro")
vim.cmd("hi! link DapUILineNumber Field")
vim.cmd("hi! link DapUIThread Namespace")
vim.cmd("hi! link DapUIStoppedThread Namespace")
vim.cmd("hi! link DapUISource Namespace")
vim.cmd("hi! link DapUIFrameName Namespace")
vim.cmd("hi! link DapUIWatchesEmpy Normal")
vim.cmd("hi! link DapUIWatchesValue Number")
vim.cmd("hi! link DapUIWatchesError Field")
vim.cmd("hi! link DapUIBreakPointsPath String")
vim.cmd("hi! link DapUIBreakPointsInfo Normal")
vim.cmd("hi! link DapUIBreakPointsCurrentLine Function")
vim.cmd("hi! link DapUIBreakPointsLine Field")
vim.cmd("hi! link DapUIBreakPointsDisabledLine Normal")

----------------------------------------------
-- HIGHLIGHTING FOR LSP DIAGNOSTICS
----------------------------------------------

vim.cmd("hi LspDiagnosticsError guifg=#c65156")
vim.cmd("hi LspDiagnosticsWarn guifg=#d29767")
vim.cmd("hi LspDiagnosticsHint guifg=#9daaaa")
vim.cmd("hi LspDiagnosticsInformation guifg=#61afef")

----------------------------------------------
-- HIGHLIGHTING FOR NEO-TREE
----------------------------------------------

vim.cmd("hi Directory guibg=#23282e guifg=#61afef")
vim.cmd("hi NeoTreeNormal guibg=#23282e guifg=#9daaaa")
vim.cmd("hi NeoTreeCursorLine guibg=#383d48 guifg=#9daaaa")
vim.cmd("hi NeoTreeSymlink guibg=#23282e guifg=#dbba75")
vim.cmd("hi link NeoTreeFileName NeTitleBar")
vim.cmd("hi NeoTreeFolderName guibg=#23282e guifg=#61afef")
vim.cmd("hi NeoTreeEmptyFolderName guibg=#23282e guifg=#61afef")
vim.cmd("hi NeoTreeOpenedFolderName guibg=#23282e guifg=#61afef")
vim.cmd("hi NeoTreeFolderIcon guibg=#23282e guifg=#61afef")
vim.cmd("hi NeoTreeRootFolder guibg=#23282e guifg=#61afef")
vim.cmd("hi NeoTreeFloatBorder guibg=#23282e guifg=#181818")
vim.cmd("hi NeoTreeTitleBar guibg=#181818 guifg=#9daaaa")
vim.cmd("hi link NeoTreeFileIcon NeoTreeNormal")
vim.cmd("hi link NeoTreeExecFile NeoTreeNormal")
vim.cmd("hi link NeoTreeOpenedFile  NeoTreeNormal")
vim.cmd("hi link NeoTreeSpecialFile NeoTreeNormal")
vim.cmd("hi link NeoTreeImageFile NeoTreeNormal")
vim.cmd("hi link NeoTreeIndentMarker NeoTreeNormal")

vim.cmd("hi NeoTreeExpander guibg=#23282e guifg=#686e78")
vim.cmd("hi NeoTreeModified guibg=#23282e guifg=#dbba75")

vim.cmd("hi NeoTreeGitModified guibg=#23282e guifg=#dbba75")
vim.cmd("hi NeoTreeGitAdded guibg=#23282e guifg=#83a76e")
vim.cmd("hi NeoTreeGitMerge guibg=#23282e guifg=#c67ada")
vim.cmd("hi NeoTreeGitRenamed guibg=#23282e guifg=#dbba75")
vim.cmd("hi NeoTreeGitUntracked guibg=#23282e guifg=#dbba75")
vim.cmd("hi NeoTreeGitIgnored guibg=#23282e guifg=#686e78")
vim.cmd("hi NeoTreeGitDeleted guibg=#23282e guifg=#c65156")
vim.cmd("hi NeoTreeGitStaged guibg=#23282e guifg=#00997b")
vim.cmd("hi NeoTreeGitUnstaged guibg=#23282e guifg=#d29767")
vim.cmd("hi NeoTreeGitConflict guibg=#23282e guifg=#9c80ff")

----------------------------------------------
-- HIGHLIGHTING FOR NVIM NOTIFY
----------------------------------------------

vim.cmd("hi NotifyERRORBorder guifg=#181818 guifg=#c65156")
vim.cmd("hi NotifyWARNBorder guifg=#181818 guifg=#dbba75")
vim.cmd("hi NotifyINFOBorder guifg=#181818 guifg=#61afef")
vim.cmd("hi NotifyDEBUGBorder guifg=#181818 guifg=#00997b")
vim.cmd("hi NotifyTRACEBorder guifg=#181818 guifg=#9daaaa")
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

vim.cmd("hi CmpItemKindType guifg=#202020 guibg=#dbba75")
vim.cmd("hi! link CmpItemKindClass CmpItemKindType")
vim.cmd("hi! link CmpItemKindConstructor CmpItemKindType")
vim.cmd("hi! link CmpItemKindInterface CmpItemKindType")
vim.cmd("hi! link CmpItemKindEnum CmpItemKindType")
vim.cmd("hi! link CmpItemKindStruct CmpItemKindType")
vim.cmd("hi! link CmpItemKindEvent CmpItemKindType")

vim.cmd("hi CmpItemKindValue guifg=#202020 guibg=#d29767")
vim.cmd("hi! link CmpItemKindNumber CmpItemKindValue")

vim.cmd("hi CmpItemKindFunction guifg=#202020 guibg=#61afef")
vim.cmd("hi! link CmpItemKindMethod CmpItemKindFunction")
vim.cmd("hi! link CmpItemKindOperator CmpItemKindFunction")

vim.cmd("hi CmpItemKindKeyword guifg=#202020 guibg=#c67ada")
vim.cmd("hi! link CmpItemKindObject CmpItemKindKeyword")
vim.cmd("hi! link CmpItemKindTag CmpItemKindKeyword")
vim.cmd("hi! link CmpItemKindBoolean CmpItemKindKeyword")

vim.cmd("hi CmpItemKindProperty guifg=#202020 guibg=#c65156")
vim.cmd("hi! link CmpItemKindField CmpItemKindProperty")

vim.cmd("hi CmpItemKindModule guifg=#202020 guibg=#00997b")
vim.cmd("hi! link CmpItemKindUnit CmpItemKindModule")
vim.cmd("hi! link CmpItemKindEnumMember CmpItemKindModule")
vim.cmd("hi! link CmpItemKindTypeParameter CmpItemKindModule")

vim.cmd("hi CmpItemKindString guifg=#202020 guibg=#83a76e")
vim.cmd("hi! link CmpItemKindCalendar CmpItemKindString")
vim.cmd("hi! link CmpItemKindWatch CmpItemKindString")

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
vim.cmd("hi! link cppStructure Keyword")
vim.cmd("hi! link cppModifier Keyword")
vim.cmd("hi! link cppOperator Function")
vim.cmd("hi! link cppStorageClass Keyword")
vim.cmd("hi! link cppStatement Normal")
vim.cmd("hi! link cStructure Keyword")
vim.cmd("hi! link cCustomClass Namespace")
vim.cmd("hi! link cBlock Normal")
vim.cmd("hi! link cParen Normal")
vim.cmd("hi! link cInclude Keyword")
vim.cmd("hi! link cType Keyword")
vim.cmd("hi cStructMember guifg=#c65156")
vim.cmd("hi cppSTLConcept guifg=#dbba75")
vim.cmd("hi cDefine guifg=#9c80ff")

----------------------------------------------------
-- CPP SEMANTIC HIGHLIGHTING
----------------------------------------------------

vim.cmd("hi! link @lsp.type.namespace.cpp @namespace")
vim.cmd("hi! link @lsp.type.typeParameter.cpp @typeParameter")
vim.cmd("hi! link @lsp.type.parameter.cpp @parameter")
vim.cmd("hi! link @lsp.type.comment.cpp @comment")
vim.cmd("hi! link @lsp.typemod.parameter.functionScope.cpp @parameter")
vim.cmd("hi! link @lsp.type.property.cpp @property")
vim.cmd("hi! link @lsp.typemod.property.classScope.cpp @property")
vim.cmd("hi! link @lsp.typemod.type.deduced.cpp @keyword")
vim.cmd("hi! link @lsp.typemod.class.deduced.cpp @keyword")
vim.cmd("hi! link @lsp.typemod.struct.deduced.cpp @keyword")
vim.cmd("hi! link @lsp.typemod.variable.classScope.cpp @property")
vim.cmd("hi @lsp.typemod.variable.static.cpp gui=bold cterm=bold")

----------------------------------------------------
-- LSP SEMANTIC HIGHLIGHTING
----------------------------------------------------

vim.cmd("hi! link @attribute Normal")
vim.cmd("hi! link @annotation PreProc")
vim.cmd("hi! link @enum Type")
vim.cmd("hi! link @function Function")
vim.cmd("hi! link @derive Define")
vim.cmd("hi! link @macro PreProc")
vim.cmd("hi! link @method Function")
vim.cmd("hi! link @namespace Namespace")
vim.cmd("hi! link @struct Type")
vim.cmd("hi! link @concept Type")
--vim.cmd("hi! link @trait Type")
vim.cmd("hi! link @trait Function")
vim.cmd("hi! link @interface Type")
vim.cmd("hi! link @constructor Type")
vim.cmd("hi! link @class Type")
vim.cmd("hi! link @union Type")
vim.cmd("hi! link @typeAlias Type")
vim.cmd("hi! link @typedef Type")
vim.cmd("hi! link @deduced Keyword")

vim.cmd("hi! link @boolean Boolean")
vim.cmd("hi! link @character String")
vim.cmd("hi! link @number Number")
vim.cmd("hi! link @string String")
vim.cmd("hi! link @escapeSequence Special")
vim.cmd("hi! link @formatSpecifier Operator")

vim.cmd("hi! link @operator Operator")
vim.cmd("hi! link @arithmetic Operator")
vim.cmd("hi! link @bitwise Operator")
vim.cmd("hi! link @comparison Operator")
vim.cmd("hi! link @logical Operator")

vim.cmd("hi! link @punctuation Operator")
vim.cmd("hi! link @punctuation.special Operator")
vim.cmd("hi! link @attributeBracket Operator")
vim.cmd("hi! link @angle Operator")
vim.cmd("hi! link @brace Operator")
vim.cmd("hi! link @bracket Operator")
vim.cmd("hi! link @parenthesis Operator")
vim.cmd("hi! link @colon Operator")
vim.cmd("hi! link @comma Operator")
vim.cmd("hi! link @dot Operator")
vim.cmd("hi! link @semi Operator")
vim.cmd("hi! link @macroBang PreProc")

vim.cmd("hi! link @builtinAttribute Keyword")
vim.cmd("hi! link @builtinType Keyword")
vim.cmd("hi! link @builtinFunction Keyword")
vim.cmd("hi! link @builtinVariable Keyword")
vim.cmd("hi! link @builtin Keyword")
vim.cmd("hi! link @comment Comment")
vim.cmd("hi! link @constParameter Parameter")
vim.cmd("hi @enumMember guifg=#00997b")
-- vim.("hi! link @generic Variable")
vim.cmd("hi! link @keyword Keyword")
vim.cmd("hi @label guifg=#9c80ff")
vim.cmd("hi! link @lifetime Property")
vim.cmd("hi! link @parameter Parameter")
vim.cmd("hi! link @parameterReference Parameter")
vim.cmd("hi! link @parameter.reference Parameter")
vim.cmd("hi! link @usedAsMutableReference Normal")
vim.cmd("hi! link @property Property")
vim.cmd("hi! link @field Property")
vim.cmd("hi! link @member Property")
vim.cmd("hi! link @structMember Property")
vim.cmd("hi @staticProperty guifg=#c65156 gui=bold cterm=bold")
vim.cmd("hi! link @staticField @staticProperty")
--vim.cmd("hi @staticVariable guifg=#9daaaa gui=bold cterm=bold")
vim.cmd("hi! link @selfKeyword Keyword")
vim.cmd("hi! link @thisKeyword Keyword")
-- vim.cmd("hi! link @toolModule  ")
vim.cmd("hi @typeParameter guifg=#00997b")
-- vim.cmd("hi! link @unresolvedReference Unresolved")
vim.cmd("hi! link @variable Variable")
vim.cmd("hi @static gui=bold")

vim.cmd("hi @referenceText cterm=underline gui=underline")
vim.cmd("hi @referenceRead cterm=underline gui=underline")
vim.cmd("hi @referenceWrite cterm=underline gui=underline")

----------------------------------------------------
-- DOXYGEN HIGHLIGHTING
----------------------------------------------------

vim.g.load_doxygen_syntax = 1
vim.cmd("hi! link doxygenBriefLine doxygenComment")
vim.cmd("hi! link doxygenBrief doxygenComment")
vim.cmd("hi! link doxygenSpecialMultilineDesc doxygenComment")
vim.cmd("hi! link doxygenSpecialOnelineDesc doxygenComment")
vim.cmd("hi doxygenParamName ctermfg=88 guifg=#a04146 cterm=italic gui=italic")
vim.cmd("hi doxygenParam guifg=#8278b4 cterm=italic,bold gui=italic,bold")
vim.cmd("hi doxygenSpecial guifg=#8278b4 cterm=italic,bold gui=italic,bold")

----------------------------------------------------
-- TREESITTER HIGHLIGHTING
----------------------------------------------------

vim.cmd("hi @preProc guifg=#c67ada")
vim.cmd("hi @storageClass guifg=#c67ada")
vim.cmd("hi! link @type Type")
vim.cmd("hi! link @type.builtin Keyword")
vim.cmd("hi! link @type.qualifier Keyword")
vim.cmd("hi @typeDefinition guifg=#dbaa75")
vim.cmd("hi! link @include Keyword")
vim.cmd("hi! link @function.call Function")
vim.cmd("hi! link @function.builtin Keyword")
vim.cmd("hi! link @function.macro Macro")
vim.cmd("hi! link @method.builtin Keyword")
vim.cmd("hi @define guifg=#9c80ff")
vim.cmd("hi @note guifg=#9c80ff")
vim.cmd("hi @literal guifg=#9daaaa")
vim.cmd("hi @tag guifg=#9c80ff")
vim.cmd("hi @tagAttribute guifg=#9daaaa")
vim.cmd("hi @constant guifg=#9daaaa")
vim.cmd("hi @constMacro guifg=#9c80ff")
vim.cmd("hi @title guifg=#9daaaa")
vim.cmd("hi @variable.classScope guifg=#c65156")
vim.cmd("hi @field.classScope guifg=#c65156")
vim.cmd("hi @property.classScope guifg=#c65156")
vim.cmd("hi @field.static guifg=#c65156")
vim.cmd("hi @property.static guifg=#c65156")
vim.cmd("hi! link @variable.builtin Keyword")
vim.cmd("hi! link @punctuation.special Punctuation")
vim.cmd("hi! link @error doxygenParamName")
vim.cmd("hi! link @constant.comment doxygenParam")
vim.cmd("hi! link @define.cpp Keyword")
vim.cmd("hi @text.todo.comment guifg=#9daaaa gui=bold")

----------------------------------------------------
-- HLARGS HIGHLIGHTING
----------------------------------------------------

vim.cmd("hi! link Hlargs @parameter")

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

