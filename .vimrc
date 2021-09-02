if !exists('g:vscode')
	execute pathogen#infect()
endif
syntax on
filetype plugin indent on
set number
set relativenumber
set mouse=a
set clipboard=unnamedplus
set nowrap
set colorcolumn=101

set background=dark
let g:one_allow_italics=1
let g:airline_theme='one'
colorscheme one

highlight ColorColumn ctermbg=lightblue guibg=#334555
highlight Normal ctermbg=darkgrey guibg=#20242a

if (empty($TMUX))
	if (has("nvim"))
		"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
		set termguicolors
	endif
endif

if !exists('g:vscode')
	set statusline+=%#warningmsg#
	set statusline+=%*

	let g:gitgutter_max_signs=2000

	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	let g:airline#extensions#whitespace#mixed_indent_algo = 2
	let g:airline#extensions#whitespace#checks = ['trailing']
	let g:airline_powerline_fonts = 1
endif

set signcolumn=yes
set splitbelow
set path+=**
set wildmenu
set inccommand:nosplit

if !exists('g:vscode')
	nnoremap <C-f> :find<space>
	" if exists('g:goneovim')
	"	 nnoremap <C-t> :GonvimFiler<CR>
	" else
	nnoremap <C-t> :CocCommand explorer<CR>
	" endif


	"CPP semantic highlighting settings
	let g:lsp_cxx_hl_use_nvim_text_props=1

	autocmd vimenter * GitGutterEnable
endif


"""""""""""""""""""""""""""""
"" GENERIC HIGHLIGHTING
"""""""""""""""""""""""""""""
hi Type ctermfg=29 guifg=#dbba75 cterm=none gui=none
hi Macro guifg=#9c80ff cterm=none gui=none
hi Function guifg=#61afef cterm=none gui=none
hi Keyword guifg=#c67ada cterm=none gui=none
hi Comment guifg=#686e78 cterm=none gui=none
hi String guifg=#83a76e cterm=none gui=none
hi Number guifg=#d29767 cterm=none gui=none
hi Normal guifg=#9daaaa cterm=none gui=none

"""""""""""""""""""""""""""""
"" CPP SEMANTIC HIGHLIGHTING
"""""""""""""""""""""""""""""
hi LspCxxHlGroupEnumConstant ctermfg=3 guifg=#00997b cterm=none gui=none
hi LspCxxHlGroupNamespace ctermfg=3 guifg=#00997b cterm=italic,bold gui=italic,bold
hi LspCxxHlGroupMemberVariable ctermfg=88 guifg=#c65156 cterm=none gui=none
hi LspCxxHlSymUnknownStaticField ctermfg=88 guifg=#c65156 cterm=bold gui=bold
hi LspCxxHlSymDependentType ctermfg=3 guifg=#00997b cterm=none gui=none
hi LspCxxHlSymTypeAlias ctermfg=29 guifg=#dbba75 cterm=none gui=none
hi LspCxxhlSymTypeParameter ctermfg=3 guifg=#00997b cterm=bold gui=bold
hi LspCxxHlSymTemplateParameter ctermfg=3 guifg=#00997b cterm=bold gui=bold
hi LspCxxHlSymVariable ctermfg=white guifg=#9daaaa cterm=none gui=none
hi LspCxxHlSymParameter ctermfg=white guifg=#6090a4 cterm=none gui=none
hi LspCxxHlSkippedRegion ctermfg=lightgrey ctermbg=darkgrey guifg=#444444 guibg=#202020
hi LspCxxHlSkippedRegionBeginEnd ctermfg=lightgrey ctermbg=darkgrey guifg=#444444 guibg=#202020

""""""""""""""""""""""""""
" DOXYGEN HIGHLIGHTING
""""""""""""""""""""""""""
let g:load_doxygen_syntax=1
hi link doxygenBriefLine doxygenComment
hi link doxygenBrief doxygenComment
hi link doxygenSpecialMultilineDesc doxygenComment
hi link doxygenSpecialOnelineDesc doxygenComment
hi doxygenParamName ctermfg=88 guifg=#a04146 cterm=italic gui=italic
hi doxygenParam guifg=#8278b4 cterm=italic,bold gui=italic,bold
hi doxygenSpecial guifg=#8278b4 cterm=italic,bold gui=italic,bold

""""""""""""""""""""""""""
" RUST SEMANTIC HIGHLIGHTING
""""""""""""""""""""""""""
hi rsKeyword guifg=#c678dd
hi rsUse guifg=#c678dd cterm=italic gui=italic
hi rsTypeParamDef ctermfg=3 guifg=#00997b
hi rsTypeParams ctermfg=3 guifg=#00997b
hi rustsModPath ctermfg=3 guifg=#00997b
hi rustModPath ctermfg=3 guifg=#00997b
hi rsModPath ctermfg=3 guifg=#00997b
hi rsModule ctermfg=3 guifg=#00997b
hi link rsAsync rsKeyword
hi link rsAwait rsKeyword
hi link rsPub rsKeyword
hi link sFn rsKeyword
hi link sMod rsKeyword
hi link sEnum rsKeyword
hi link sStruct rsKeyword
hi rsSuper ctermfg=88 guifg=#dbba75
hi link rsRef rsKeyword
hi link rsStatic rsKeyword
hi link rsConst rsKeyword
hi rsCrate ctermfg=88 guifg=#00997b
hi rsUnsafe ctermfg=88 guifg=#c65156 cterm=bold gui=bold
hi link rsLet rsKeyword
hi link rsMut rsKeyword
hi rsSelfType guifg=#dbba75
hi link rsSelfValue rsKeyword
hi rsUserMacro guifg=#9c80ff cterm=none gui=none
hi rsIdentifier ctermfg=white guifg=#abb2bf cterm=none gui=none
hi rsUserIdent ctermfg=white guifg=#abb2bf cterm=none gui=none
hi rsIdentDef ctermfg=white guifg=#abb2bf cterm=none gui=none
hi rsIdent ctermfg=white guifg=#abb2bf cterm=none gui=none
hi rsFieldAccess ctermfg=88 guifg=#c65156 cterm=none gui=none
hi rsLifetimeDef ctermfg=88 guifg=#c65156 cterm=italic gui=italic
hi rsDelimiter ctermfg=white guifg=#979da9
hi rsOperator ctermfg=white guifg=#979da9
hi link rustDerive Keyword
hi link rustAttribute Keyword
hi link rustDeriveTrait Type

"""""""""""""""""""""""""""""""""
" COC.NVIM SEMANTIC HIGHLIGHTING
"""""""""""""""""""""""""""""""""
hi! CocSem_namespace ctermfg=3 guifg=#00997b cterm=italic,bold gui=italic,bold
hi! link CocSem_class Type
hi! link CocSem_enum Type
hi! link CocSem_interface Type
hi! link CocSem_struct Type
hi! link CocSem_concept Type
hi! link CocSem_builtinType Type
hi! CocSem_typeParameter ctermfg=3 guifg=#00997b cterm=bold gui=bold
hi! link CocSem_type Type
hi! link CocSem_typeAlias Type
hi! link CocSem_selfKeyword Keyword
hi! CocSem_parameter ctermfg=white guifg=#6090a4 cterm=none gui=none
hi! CocSem_variable ctermfg=white guifg=#9daaaa cterm=none gui=none
hi! CocSem_property ctermfg=88 guifg=#c65156 cterm=none gui=none
hi! CocSem_enumMember ctermfg=3 guifg=#00997b cterm=none gui=none
hi! link CocSem_lifetime CocSem_property
hi! link CocSem_event Function
hi! link CocSem_function Function
hi! link CocSem_dependent Function
hi! link CocSem_method Function
hi! link CocSem_macro Macro
hi! link CocSem_attribute Type
hi! link CocSem_label Keyword
hi! link CocSem_comment Comment
hi! link CocSem_string String
hi! link CocSem_formatSpecifier String
hi! link CocSem_keyword Keyword
hi! link CocSem_number Number
hi! link CocSem_regexp CocSem_string
hi! link CocSem_operator CocSem_variable
hi! link CocSem_brace CocSem_variable
hi! link CocSem_comma CocSem_variable
hi! link CocSem_semicolon CocSem_variable
hi! link CocSem_parenthesis CocSem_variable
hi! link CocSem_angle CocSem_variable
hi! link CocSem_colon CocSem_variable
hi! link CocSem_bracket CocSem_variable
hi! link CocSem_punctuation CocSem_variable
hi! link CocSem_unresolvedReference CocSem_variable
hi link CocHintSign Comment

if !exists('g:vscode')
	"coc settings
	let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-css', 'coc-git', 'coc-html',
				\'coc-java', 'coc-json', 'coc-marketplace', 'coc-omnisharp', 'coc-python',
				\'coc-rust-analyzer', 'coc-sh', 'coc-snippets', 'coc-sql', 'coc-toml', 'coc-tsserver',
				\'coc-vimlsp', 'coc-xml', 'coc-yaml']
endif

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=500
set shortmess+=c

let g:DoxygenToolkit_commentType="C++"
nnoremap <S-D> :Dox<CR>

if exists('g:vscode')
	nnoremap <C-k> :call VSCodeCall("editor.action.showHover")<CR>
	autocmd CursorHold * call VSCodeCall("editor.action.showHover")
endif

if !exists('g:vscode')
	let g:airline#extensions#coc#enabled=1
	set statusline^=%{coc#status()}
	autocmd CursorHold * if ! coc#float#has_float() | silent call Show_documentation() | endif
	nnoremap <C-k> :call Show_documentation()<CR>


	function! Show_documentation()
		"if (index(['vim', 'help'], &filetype) >= 0)
		"	execute 'h '.expand('<cword>')
		"else
		call CocActionAsync('doHover')
		"endif
	endfunction

	inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	let g:coc_snippet_next = '<tab>'
	let g:coc_snippet_previous = '<S-tab>'

	autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gs :CocCommand clangd.switchSourceHeader<CR>
	nmap <S-f> <Plug>(coc-codeaction-selected)<CR>

	function! SplitIfNotOpen(...)
		" Ref: https://github.com/neoclide/coc.nvim/blob/7e9e0e91e24fc447e96079ae59e9f6caffe604a4/autoload/coc/util.vim#L380-L383
		let cursorCmd = ''
		let fname = a:1
		if a:0 == 2  " Two arguments.
			let cursorCmd = a:1
			let fname = a:2
		endif
		if fname != fnamemodify(expand('%'), ':p:~:.')
			exec 'vsplit '.fname
		endif
		if len(cursorCmd)
			exec cursorCmd
		endif
	endfunction

	command! -nargs=+ CocSplitIfNotOpen :call SplitIfNotOpen(<f-args>)
endif

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent

nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-c> :bd<CR>

nnoremap<C-s> :vsplit<CR>

nnoremap <A-h> 0
nnoremap <A-l> $
nnoremap<S-l> <C-w><C-l>
nnoremap<S-h> <C-w><C-h>
nnoremap<S-j> <C-w><C-j>
nnoremap<S-k> <C-w><C-h>

nnoremap <C-Up> <C-w><C-k>
nnoremap <C-Down> <C-w><C-j>
nnoremap <C-Left> <C-w><C-h>
nnoremap <C-Right> <C-w><C-l>

map <C-l> :CocDiagnostics<CR>
map <C-l><C-k> :lclose<CR>

autocmd! BufRead,BufNewFile *.clang-tidy setfiletype yaml
autocmd! BufRead,BufNewFile *.clang-format setfiletype yaml
autocmd! BufRead,BufNewFile *.clangd setfiletype yaml
autocmd! BufRead,BufNewFile CMakeFiles.text setfiletype cmake
autocmd! BufRead,BufNewFile *.cmake setfiletype cmake

if !exists('g:vscode')
	function! <SID>AutoIndentOnOpen()
		if &modifiable
			if &ft=='text' || &ft=='sql' || &ft=='html' || &ft=='md' || &ft=='markdown' || &ft=='dockerfile'
			else
				if &ft=='cpp' || &ft=='c' || &ft=='rust' || &ft=='toml' || &ft=='yaml' || &ft=='yml' || &ft=='YAML'
					call CocActionAsync('format')
				else
					:Autoformat<CR>
				endif
			endif
		endif
	endfun

	function! <SID>AutoIndentOnClose()
		if &modifiable
			if &ft=='text' || &ft=='sql' || &ft=='html' || &ft=='md' || &ft=='markdown' || &ft=='dockerfile' || &ft=='rst'
			else
				if &ft=='cpp' || &ft=='c' || &ft=='rust' || &ft=='toml' || &ft=='yaml' || &ft=='yml' || &ft=='YAML'
					"call CocActionAsync('format')
				else
					:Autoformat<CR>
				endif
			endif
		endif
	endfun

	autocmd BufRead * :call <SID>AutoIndentOnOpen()
	autocmd BufWritePre * :call <SID>AutoIndentOnClose()

	"view the syntax highlight group under the cursor
	map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
				\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
				\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
endif
