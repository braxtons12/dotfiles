--vim.cmd [[packadd nvim-lspconfig]]
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

----------------------------------------------
-- PLUGINS
----------------------------------------------
require('packer').startup(function(use)
	use "wbthomason/packer.nvim"

	if packer_bootstrap then
		require('packer').sync()
	end
end)

vim.cmd("autocmd ColorScheme * highlight PMenu ctermbg=darkgrey guibg=#262b33, guifg=#9daaaa")
vim.cmd("autocmd ColorScheme * highlight PMenuSel ctermbg=darkgrey ctermfg=lightblue guibg=#20242b guifg=#61afef")
vim.cmd("autocmd ColorScheme * highlight Float guibg=#262b33")
vim.cmd("autocmd ColorScheme * highlight FloatBorder guifg=#9daaaa guibg=#262b33")

local border = {
	--{ "┌", "FloatBorder" },
	--{ "─", "FloatBorder" },
	--{ "┐", "FloatBorder" },
	--{ "│", "FloatBorder" },
	--{ "┘", "FloatBorder" },
	--{ "─", "FloatBorder" },
	--{ "└", "FloatBorder" },
	--{ "│", "FloatBorder" },
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
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
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 1000
vim.o.timeoutlen = 2000
vim.cmd("set shortmess+=c")

vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.wildmenu = true
vim.cmd("set inccommand:nosplit")

vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	update_in_insert = true,
})
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

----------------------------------------------
-- AUTOCOMMANDS
----------------------------------------------
vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{
		pattern = { "*.clang-tidy", "*.clang-format", "*.clangd" },
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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)

vim.api.nvim_create_autocmd(
				"CursorHold",
				{
					pattern = {"*"},
					callback = function()
						local cmp = require("cmp")
						if not cmp.visible() then
							local hover_fixed = function()
								vim.api.nvim_command("set eventignore=CursorHold")
								vim.lsp.buf.hover()
								vim.api.nvim_command("set eventignore=\"\"")
							end
							hover_fixed()
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
vim.cmd("highlight ColourColumn ctermbg=darkgrey guibg=#262b33 ctermfg=lightgrey guifg=#383d48")
vim.cmd("highlight Normal ctermbg=darkgrey guibg=#262b33")
vim.cmd("highlight VertSplit ctermbg=darkgrey guibg=#262b33 ctermfg=lightgrey guifg=#383d48")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

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
vim.cmd("hi link NotifyERRORBody Normal")
vim.cmd("hi link NotifyWARNBody Normal")
vim.cmd("hi link NotifyINFOBody Normal")
vim.cmd("hi link NotifyDEBUGBody Normal")
vim.cmd("hi link NotifyTRACEBody Normal")

----------------------------------------------
-- HIGHLIGHTING FOR NVIM CMP
----------------------------------------------

vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
vim.cmd("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
vim.cmd("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6")

vim.cmd("highlight! CmpItemKindType guibg=NONE guifg=#dbba75")
vim.cmd("highlight! CmpItemKindClass guibg=NONE guifg=#dbba75")
vim.cmd("hi! link CmpItemKindConstructor CmpItemKindType")
vim.cmd("hi! link CmpItemKindInterface CmpItemKindType")
vim.cmd("hi! link CmpItemKindEnum CmpItemKindType")
vim.cmd("hi! link CmpItemKindStruct CmpItemKindType")
vim.cmd("hi! link CmpItemKindEvent CmpItemKindType")

vim.cmd("highlight! CmpItemKindText guibg=NONE guifg=#9daaaa")
vim.cmd("hi! link CmpItemKindVariable CmpItemKindText")
vim.cmd("hi! link CmpItemKindSnippet CmpItemKindText")
vim.cmd("hi! link CmpItemKindConstant CmpItemKindText")

vim.cmd("highlight! CmpItemKindValue guibg=NONE guifg=#d29767")
vim.cmd("hi! link CmpItemKindNumber CmpItemKindValue")

vim.cmd("highlight! CmpItemKindFunction guibg=NONE guifg=#61afef")
vim.cmd("hi! link CmpItemKindMethod CmpItemKindFunction")
vim.cmd("hi! link CmpItemKindOperator CmpItemKindFunction")

vim.cmd("highlight! CmpItemKindKeyword guibg=NONE guifg=#c67ada")
vim.cmd("hi! link CmpItemKindObject CmpItemKindKeyword")
vim.cmd("hi! link CmpItemKindTag CmpItemKindKeyword")
vim.cmd("hi! link CmpItemKindBoolean CmpItemKindKeyword")

vim.cmd("highlight! CmpItemKindProperty guibg=NONE guifg=#c65156")
vim.cmd("hi! link CmpItemKindField CmpItemKindProperty")

vim.cmd("highlight! CmpItemKindModule guibg=NONE guifg=#00997b")
vim.cmd("hi! link CmpItemKindUnit CmpItemKindModule")
vim.cmd("hi! link CmpItemKindEnumMember CmpItemKindModule")
vim.cmd("hi! link CmpItemKindTypeParameter CmpItemKindModule")

vim.cmd("highlight! CmpItemKindString guibg=NONE guifg=#83a76e")
vim.cmd("hi! link CmpItemKindCalendar CmpItemKindString")
vim.cmd("hi! link CmpItemKindWatch CmpItemKindString")

----------------------------------------------
-- GENERIC HIGHLIGHTING
----------------------------------------------
vim.cmd("hi! Type ctermfg=29 guifg=#dbba75 cterm=none gui=none")
vim.cmd("hi! Macro guifg=#9c80ff cterm=none gui=none")
vim.cmd("hi! Function guifg=#61afef cterm=none gui=none")
vim.cmd("hi! Keyword guifg=#c67ada cterm=none gui=none")
vim.cmd("hi! Comment guifg=#686e78 cterm=none gui=none")
vim.cmd("hi! String guifg=#83a76e cterm=none gui=none")
vim.cmd("hi! Number guifg=#d29767 cterm=none gui=none")
vim.cmd("hi! Normal guifg=#9daaaa cterm=none gui=none")
vim.cmd("hi! Variable guifg=#9daaaa cterm=none gui=none")
vim.cmd("hi! Field guifg=#c65156 cterm=none gui=none")
vim.cmd("hi! Property guifg=#c65156 cterm=none gui=none")
vim.cmd("hi! Namespace guifg=#00997b cterm=none gui=none")

----------------------------------------------
-- C/CPP HIGHLIGHTING
----------------------------------------------
vim.g.cpp_attributes_highlight = 1
vim.g.cpp_member_highlight = 1

vim.cmd("hi! link CUserFunction Macro")
vim.cmd("hi! link cppAttribute Normal")
vim.cmd("hi! link CStructMember Property")

vim.g.cpp_class_scope_highlight = 1
vim.g.cpp_member_variable_highlight = 1
vim.g.cpp_lcass_decl_highlight = 1
vim.g.cpp_posix_standard = 1
vim.g.cpp_experimential_template_highlight = 1
vim.g.cpp_concepts_highlight = 1

vim.cmd("hi! link cCustomFunc Macro")
vim.cmd("hi! link CCustomMemVar Property")
vim.cmd("hi! link cppSTLnamespace Namespace")
vim.cmd("hi! link cCustomClass Namespace")

----------------------------------------------------
-- CPP SEMANTIC HIGHLIGHTING
----------------------------------------------------

vim.cmd("hi LspCxxHlGroupEnumConstant ctermfg=3 guifg=#00997b cterm=none gui=none")
vim.cmd("hi LspCxxHlGroupNamespace ctermfg=3 guifg=#00997b cterm=italic,bold gui=italic,bold")
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
vim.cmd("hi! cStructMember guifg=#c65156")
--vim.cmd("hi! cCommentL guifg=#9c80ff")
vim.cmd("hi! cppSTLConcept guifg=#dbba75")
vim.cmd("highlight Delimiter guifg=#9daaaa")
vim.cmd("highlight TSParameter guifg=#6090a4")
vim.cmd("highlight TSParameterReference guifg=#6090a4")
vim.cmd("highlight TSConstructor guifg=#dbba75")
vim.cmd("highlight Identifier guifg=#9daaaa")
vim.cmd("highlight TSField guifg=#c65156")
vim.cmd("highlight TSProperty guifg=#c65156")
vim.cmd("highlight TSAnnotation guifg=#9c80ff")
vim.cmd("highlight TSAttribute guifg=#9daaaa")
vim.cmd("highlight TSNamespace guifg=#00997b")
vim.cmd("highlight TSPreProc guifg=#c67ada")
vim.cmd("highlight TSStorageClass guifg=#c67ada")
vim.cmd("highlight TSTypeDefinition guifg=#dbaa75")
vim.cmd("highlight TSInclude guifg=#c67ada")
vim.cmd("highlight TSDefine guifg=#9c80ff")
vim.cmd("highlight cDefine guifg=#9c80ff")
vim.cmd("highlight Define guifg=#9c80ff")
vim.cmd("highlight PreProc guifg=#9c80ff")
vim.cmd("highlight TSNote guifg=#9c80ff")
vim.cmd("highlight TSLiteral guifg=#9c80ff")
vim.cmd("highlight TSTag guifg=#9c80ff")
vim.cmd("highlight TSLabel guifg=#9c80ff")
vim.cmd("highlight TSTagAttribute guifg=#9daaaa")
vim.cmd("highlight TSConstant guifg=#8278b4")
vim.cmd("highlight TSConstMacro guifg=#9c80ff")
vim.cmd("highlight TSTitle guifg=#9daaaa")
vim.cmd("highlight Operator guifg=#9daaaa")

vim.cmd("hi! link LspSemantic_attribute Define")
vim.cmd("hi! link LspSemantic_enum Type")
vim.cmd("hi! link LspSemantic_function Function")
vim.cmd("hi! link LspSemantic_derive Define")
vim.cmd("hi! link LspSemantic_macro PreProc")
vim.cmd("hi! link LspSemantic_method Function")
vim.cmd("hi! LspSemantic_namespace guifg=#00997b")
vim.cmd("hi! link LspSemantic_struct Type")
vim.cmd("hi! link LspSemantic_concept Type")
vim.cmd("hi! link LspSemantic_trait Type")
vim.cmd("hi! link LspSemantic_interface Type")
vim.cmd("hi! link LspSemantic_typeAlias Type")
vim.cmd("hi! link LspSemantic_constructor Type")
vim.cmd("hi! link LspSemantic_class Type")
vim.cmd("hi! link LspSemantic_union Type")
vim.cmd("hi! link LspSemantic_type_alias Type")
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

vim.cmd("hi! link LspSemantic_builtinAttribute Define")
vim.cmd("hi! link LspSemantic_builtinType Type")
vim.cmd("hi! link LspSemantic_builtinFunction Keyword")
vim.cmd("hi! link LspSemantic_builtinVariable Keyword")
vim.cmd("hi! link LspSemantic_comment Comment")
vim.cmd("hi! link LspSemantic_constParameter Parameter")
vim.cmd("hi! LspSemantic_enumMember guifg=#00997b")
-- vim.(" [[highlight link LspSemantic_generic Variable")
vim.cmd("hi! link LspSemantic_keyword Keyword")
vim.cmd("hi! link LspSemantic_label Label")
vim.cmd("hi! link LspSemantic_lifetime Property")
vim.cmd("hi! link LspSemantic_parameter Parameter")
vim.cmd("hi! link LspSemantic_parameterReference Parameter")
vim.cmd("hi! link LspSemantic_property Property")
vim.cmd("hi! link LspSemantic_field Property")
vim.cmd("hi! link LspSemantic_member Property")
vim.cmd("hi! link LspSemantic_structMember Property")
vim.cmd("hi! link LspSemantic_staticProperty Property")
vim.cmd("hi! link LspSemantic_selfKeyword Keyword")
vim.cmd("hi! link LspSemantic_thisKeyword Keyword")
-- vim.cmd("highlight link LspSemantic_toolModule  ")
vim.cmd("hi! LspSemantic_typeParameter guifg=#00997b")
vim.cmd("hi! LspSemantic_namespace guifg=#00997b gui=italic")
-- vim.cmd("highlight link LspSemantic_unresolvedReference Unresolved")
vim.cmd("hi! link LspSemantic_variable Variable")
vim.cmd("hi! LspSemantic_static gui=bold")

vim.cmd("hi! LspReferenceText cterm=underline gui=underline")
vim.cmd("hi! LspReferenceRead cterm=underline gui=underline")
vim.cmd("hi! LspReferenceWrite cterm=underline gui=underline")

----------------------------------------------
-- DOXYGEN HIGHLIGHTING
----------------------------------------------
vim.g.load_doxygen_syntax = 1
vim.cmd("hi link doxygenBriefLine doxygenComment")
vim.cmd("hi link doxygenBrief doxygenComment")
vim.cmd("hi link doxygenSpecialMultilineDesc doxygenComment")
vim.cmd("hi link doxygenSpecialOnelineDesc doxygenComment")
vim.cmd("hi doxygenParamName ctermfg=88 guifg=#a04146 cterm=italic gui=italic")
vim.cmd("hi doxygenParam guifg=#8278b4 cterm=italic,bold gui=italic,bold")
vim.cmd("hi doxygenSpecial guifg=#8278b4 cterm=italic,bold gui=italic,bold")

----------------------------------------------
-- KEYMAPS
----------------------------------------------

function map(mode, lhs, rhs, description, opts)
	local options = {
		noremap = true,
		silent = true
	}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	local wk_options = {
		mode = mode,
		prefix = "",
		buffer = nil,
		noremap = options.noremap,
		silent = options.silent,
	}
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	local wk = require("which-key")
	wk.register({
		[lhs] = {
			rhs,
			description,
		},
	}, wk_options)
end

function nmap(lhs, rhs, options)
	map("n", lhs, rhs, options)
end

function tmap(lhs, rhs, options)
	map("t", lhs, rhs, options)
end

vim.g.mapleader = ' '
nmap("<S-f>", "<cmd>lua require(\"telescope.builtin\").find_files(require(\"telescope.themes\").get_dropdown({}))<CR>", "Telescope Find Files")
nmap("<S-A-g>", "<cmd>lua require(\"telescope.builtin\").live_grep(require(\"telescope.themes\").get_dropdown({}))<CR>", "Telescope Live Grep")
nmap("<C-t>", "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree")
nmap("<S-D>", "<cmd>Dox<CR>", "Create a Doxygen Comment")
nmap("<C-p>", "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer")
nmap("<C-n>", "<cmd>BufferLineCycleNext<CR>", "Next Buffer")
nmap("<C-m><C-p>", "<cmd>BufferLineMovePrev<CR>", "Move Buffer Back One")
nmap("<C-m><C-n>", "<cmd>BufferLineMoveNext<CR>", "Move Buffer Forward One")
nmap("<C-c>", "<cmd>bd<CR>", "Delete Current Buffer")
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

nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Defintion")
nmap("gc", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration")
nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation")
nmap("<C-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", "Open Documentation Hover")
nmap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
nmap("<Leader>rn", "<cmd>lua require(\"cosmic-ui\").rename()<CR>", "Rename")
nmap("<A-CR>", "<cmd>lua require(\"cosmic-ui\").code_actions()<CR>", "Code Actions")
nmap("<C-A-l>", "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document")

nmap("<F10>",
	":echo \"hi<\" . synIDattr(synID(line(\".\"),col(\".\"),1),\"name\") . '> trans<'\
				. synIDattr(synID(line(\".\"),col(\".\"),0),\"name\") . \"> lo<\"\
				. synIDattr(synIDtrans(synID(line(\".\"),col(\".\"),1)),\"name\") . \">\"<CR>",
	"Show Highlight Group For Token"
)
