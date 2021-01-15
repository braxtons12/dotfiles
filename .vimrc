execute pathogen#infect()
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

" NERDTRees File highliting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', '2', 'none', '2', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', '3', 'none', '#3366ff', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
let g:NERDTreeShowHidden=1

set statusline+=%#warningmsg#
set statusline+=%*

let g:gitgutter_max_signs=2000

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#whitespace#checks = ['trailing']

set signcolumn=yes
set splitbelow
set path+=**
set wildmenu
set inccommand:nosplit

nnoremap <C-f> :find<space>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:loaded_sql_completion = 0
let g:omni_sql_no_default_maps = 1
let g:neomake_java_enabled_makers = ['']

autocmd vimenter * GitGutterEnable

"CPP semantic highlighting settings
let g:lsp_cxx_hl_use_nvim_text_props=1

"autocmd InsertLeave,InsertEnter,BufRead,BufWritePre * :LspCxxHighlight

let g:load_doxygen_syntax=1
hi LspCxxHlGroupEnumConstant ctermfg=3 guifg=#00997b cterm=none gui=none
hi LspCxxHlGroupNamespace ctermfg=3 guifg=#00997b cterm=italic,bold gui=italic,bold
hi LspCxxHlGroupMemberVariable ctermfg=88 guifg=#c65156 cterm=none gui=none
hi LspCxxHlSymUnknownStaticField ctermfg=88 guifg=#c65156 cterm=bold gui=bold
hi LspCxxHlSymDependentType ctermfg=3 guifg=#00997b cterm=none gui=none
hi Type ctermfg=29 guifg=#dbba75 cterm=none gui=none
hi LspCxxHlSymTypeAlias ctermfg=29 guifg=#dbba75 cterm=none gui=none
hi LspCxxhlSymTypeParameter ctermfg=3 guifg=#00997b cterm=bold gui=bold
hi LspCxxHlSymTemplateParameter ctermfg=3 guifg=#00997b cterm=bold gui=bold
hi LspCxxHlSymVariable ctermfg=white guifg=#9daaaa cterm=none gui=none
hi LspCxxHlSymParameter ctermfg=white guifg=#6090a4 cterm=none gui=none
hi Macro guifg=#9c80ff cterm=none gui=none
hi LspCxxHlSkippedRegion ctermfg=lightgrey ctermbg=darkgrey guifg=#444444 guibg=#202020
hi LspCxxHlSkippedRegionBeginEnd ctermfg=lightgrey ctermbg=darkgrey guifg=#444444 guibg=#202020
hi link doxygenBriefLine doxygenComment
hi link doxygenBrief doxygenComment
hi link doxygenSpecialMultilineDesc doxygenComment
hi link doxygenSpecialOnelineDesc doxygenComment
hi doxygenParamName ctermfg=88 guifg=#a04146 cterm=italic gui=italic
hi doxygenParam guifg=#8278b4 cterm=italic,bold gui=italic,bold
hi doxygenSpecial guifg=#8278b4 cterm=italic,bold gui=italic,bold

"function to tell what syntax group something belong to
"function! SynGroup()
"	let l:s = synID(line('.'), col('.'), 1)
"	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
"endfun

"nnoremap s :call SynGroup()<CR>

"rust semantic highlighting settings
hi rsUse ctermfg=lightblue guifg=#61afef cterm=italic,bold gui=italic,bold
"purple keywords
hi rsKeyword guifg=#c678dd
"red keywords
"hi rsKeyword guifg=#c65156
hi rsTypeParamDef ctermfg=3 guifg=#00997b
hi rsTypeParams ctermfg=3 guifg=#00997b
hi rustsModPath ctermfg=3 guifg=#00997b
hi rsAsync ctermfg=88 guifg=#c65156
"hi rsAwait ctermfg=88 guifg=#c65156
hi rsFn ctermfg=88 guifg=#c65156
hi rsPub ctermfg=88 guifg=#c65156
hi rsMod ctermfg=88 guifg=#c65156
hi rsSuper ctermfg=88 guifg=#c65156
hi rsRef ctermfg=88 guifg=#c65156
hi rsStatic ctermfg=88 guifg=#c65156
hi rsConst ctermfg=88 guifg=#c65156
hi rsCrate ctermfg=88 guifg=#c65156
hi rsUnsafe ctermfg=88 guifg=#c65156
hi rsLet ctermfg=88 guifg=#c65156
hi rsMut ctermfg=29 guifg=#dbba75
hi rsSelfType guifg=#e5c07b
hi rsSelfValue guifg=#e5c07b
hi rsUserMacro guifg=#9c80ff cterm=none gui=none
hi rsIdentifier ctermfg=white guifg=#9daaaa cterm=none gui=none
hi rsFieldAccess ctermfg=88 guifg=#c65156 cterm=none gui=none

"coc settings
let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-css', 'coc-git', 'coc-html',
			\'coc-java', 'coc-json', 'coc-marketplace', 'coc-omnisharp', 'coc-python',
			\'coc-rust-analyzer', 'coc-sh', 'coc-snippets', 'coc-sql', 'coc-toml', 'coc-tsserver',
			\'coc-vimlsp', 'coc-xml', 'coc-yaml']
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=500
set shortmess+=c
let g:airline#extensions#coc#enabled=1
set statusline^=%{coc#status()}
autocmd CursorHold * if ! coc#float#has_float() | silent call Show_documentation() | endif
nnoremap <C-k> :call Show_documentation()<CR>
hi link CocHintSign Comment
let g:DoxygenToolkit_commentType="C++"
nnoremap <C-D> :Dox<CR>

"ALE settings
"let g:ale_linters = {
""			\'cpp': ['cppcheck', 'clangcheck', 'clangtidy'],
""			\'c': ['cppcheck', 'clangcheck', 'clangtidy']
""			\}
let g:ale_linters = {
			\
			\ }
"let g:ale_linters_explicit=1
"let g:ale_c_parse_compile_commands=1
"let g:ale_cpp_parse_compile_commands=1
"let g:ale_set_balloons=1
"let g:ale_cpp_clangtidy_checks= ['bugprone-*', 'cert-*', 'clang-analyer-*', 'cppcoreguidelines-*', 'google-*',
"			\'hicpp-*', 'misc-*', 'modernize-*', 'performance-*', 'portability-*', 'readability-*',
"			\'-hicpp-special-member-functions', '-cppcoreguidelines-special-member-functions',
"			\'-misc-non-private-member-variables-in-classes', '-cppcoreguidelines-non-private-member-variables-in-classes',
"			\'-readability-magic-numbers', '-cppcoreguidelines-avoid-magic-numbers', '-readability-else-after-return',
"			\'-google-default-arguments']
"let g:ale_cpp_clangtidy_extra_options = ''
"let g:ale_cpp_clangtidy_options = ''
"let g:airline#extensions#ale#enabled=1

set exrc

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

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent

"chromatica syntax highlighting settings
"assuming libclang.so is at /usr/lib/libclang.so
"if not, need to let g:chromatica#libclang_path='pathtolibclang.so'
"let g:chromatica#enable_at_startup=1

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

function! <SID>AutoIndent()
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

autocmd BufRead,BufWritePre * :call <SID>AutoIndent()
"autocmd BufRead,BufWritePre * :Autoformat<CR>
