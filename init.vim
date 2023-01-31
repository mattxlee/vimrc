" ---- All plugins here ----
call plug#begin()
Plug 'vim-scripts/a.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/LeaderF'
Plug 'eugen0329/vim-esearch'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tomtom/tcomment_vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'preservim/vim-markdown'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
call plug#end()
" ---- end of All plugins here ----

" ---- Common settings ----
let c_no_curly_error=1
let g:tex_conceal=""
set mouse=
set nu
set ignorecase
set smartcase
set noshowmode
set showtabline=0
set updatetime=666
set hlsearch
set linebreak
set breakindent
set breakindentopt=shift:8
set nobackup
set nowritebackup
set noswapfile
set signcolumn=number
set cursorline
if has('termguicolors')
    set termguicolors
endif
set autoindent
set nocindent
set nosmartindent
filetype indent off
set complete=.,w,b,u,t
" ---- Common shortcuts ----
set cmdheight=1
let mapleader=';'
noremap N :noh<CR>
noremap K :on<CR>
noremap * :keepjumps normal! mi*`i<CR>
noremap <Leader>s :sp<CR>
noremap <Leader>v :vsp<CR>
noremap <Leader>wj :silent horizontal resize +5<CR>
noremap <Leader>wk :silent horizontal resize -5<CR>
noremap <Leader>wl :silent vertical resize +5<CR>
noremap <Leader>wh :silent vertical resize -5<CR>
" ---- end of Common settings ----

" ---- Windows settings ----
if has("win32")
    set guifont=Consolas:h12
    au GUIEnter * simalt ~x
elseif has("mac")
    set guifont=Menlo:h15
endif
set go-=T
set go-=r
set go-=L
set go-=m
" ---- end of Windows settings ----

" ---- Color scheme ----
set background=dark
silent! colorscheme gruvbox
hi Visual cterm=none ctermfg=gray ctermbg=blue gui=none guifg=gray guibg=blue
" ---- end of Color scheme ----

" ---- Airline ----
let g:airline_symbols_ascii=1
let g:airline_powerline_fonts=0
let g:airline#extensions#gutentags#enabled=1
" ---- end of Airline ----

" ---- TrailerTrim settings ----
noremap <Leader>t :StripWhitespace<CR>
" ---- end of TrailerTrim settings ----

" ---- Fugitive settings ----
noremap <C-G> :Git<CR>
" ---- end of Fugitive settings ----

" These two env variables to use pygments as tag parser for extra languages
let $GTAGSLABEL='native-pygments'
let $GTAGSCONF='/usr/local/share/gtags/gtags.conf'
" ---- CTags settings ----
let g:gutentags_define_advanced_commands=1
let g:gutentags_project_root=['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_generate_on_empty_buffer=1
let g:gutentags_generate_on_missing=1
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules+=['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules+=['gtags_cscope']
endif
let s:vim_tags=expand('~/.cache/tags')
let g:gutentags_ctags_exclude=['node_modules', '.ccls-cache']
let g:gutentags_cache_dir=s:vim_tags
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
let g:gutentags_ctags_extra_args+=['--c-kinds=+px']
let g:gutentags_ctags_extra_args+=['--output-format=e-ctags']
let g:gutentags_auto_add_gtags_cscope=0
let g:gutentags_exclude_filetypes=['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_plus_nomap=1
noremap <silent> gr :GscopeFind s <C-R><C-W><CR>
noremap <silent> gh :GscopeFind g <C-R><C-W><CR>
noremap <silent> gd :GscopeFind z <C-R><C-W><CR>
" ---- end of CTags settings ----

" ---- Quickfix preview settings ----
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<CR>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<CR>
" ---- end of Quickfix preview settings ----

" ---- LeaderF related settings ----
let g:Lf_WindowPosition='bottom'
let g:Lf_ShortcutF='<C-P>'
let g:Lf_WildIgnore={
            \ 'dir': ['.svn', '.git', '.hg', '.ccls-cache', 'node_modules'],
            \ 'file': ['*.sw?','*.bak','*.exe','*.o','*.so']
            \}
let g:Lf_StlSeparator={'left': '', 'right': '', 'font': ''}
let g:Lf_RootMarkers=['.root', '.svn', '.git', '.hg', '.project']
let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_CacheDirectory=expand('~/.vim/cache')
let g:Lf_ShowRelativePath=0
let g:Lf_PreviewResult={'Function':0, 'BufTag':0}
let g:Lf_ShowDevIcons=0
let g:Lf_RgConfig = [
    \ "--max-columns=150",
    \ "--glob=!node_modules/*",
    \ "--glob=!dist/*",]
noremap <Leader>o :LeaderfFunction<CR>
noremap <Leader>g :LeaderfTag<CR>
noremap <Leader>l :Leaderf rg<CR>
" ---- end of LeaderF related settings ----

" ---- Editorconfig settings ----
let g:EditorConfig_preserve_formatoptions=1
let g:EditorConfig_max_line_indicator="fill"
" ---- end of Editorconfig settings ----

" ---- Json settings ----
let g:vim_json_conceal=0
" ---- end of Json settings ----

" ---- Markdown settings ----
hi link markdownError NONE
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks=0
let g:vim_markdown_folding_disabled=1
" ---- end of Markdown settings ----

" ---- Neoformat settings ----
noremap C :Neoformat<CR>
" ---- end of Neoformat settings ----

" ---- Switch header/source ----
let g:fsnonewfiles='on'
let g:alternateNoDefaultAlternate=1
noremap <C-H> :silent A<CR>\|:e<CR>
" ---- end of Switch header/source ----

" ---- NERDTree settings ----
let g:NERDTreeMinimalMenu=1
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden=1
let g:NERDTreeGitStatusUseNerdFonts=0
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
function OpenTree()
    if bufname('%') == ''
        :silent! NERDTreeToggle
    else
        :silent! NERDTreeFind
    endif
endfunction
noremap <C-J> :call OpenTree()<CR>
noremap <Leader>j :NERDTreeToggle<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" ---- end of NERDTree settings ----

" ---- Yank to clipboard ----
vnoremap <leader>y :OSCYank<CR>
" ---- end of Yank to clipboard ----

" ---- Easymotion settings ----
let g:EasyMotion_do_mapping=1
" ---- end of Easymotion settings ----

" ---- Rainbow settings ----
let g:rainbow_active=1
let g:rainbow_conf={
\	'guifgs': ['darkorange3', 'seagreen3', 'royalblue1'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,\|;\|\.\|&\||\|:\|->\|=\|-\|<\|>\|!\|?\|+\|*_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\		'nerdtree': 0,
\       'cmake': 0,
\       'qf': 0,
\	}
\}
" ---- end of Rainbow settings ----

