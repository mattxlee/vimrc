" ---- All plugins here ----
call plug#begin()

" theme
Plug 'morhetz/gruvbox'

" layouts
Plug 'vim-airline/vim-airline'

" jumping
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" global search
Plug 'dyng/ctrlsf.vim'

" git related
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" format and etc.
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'

" common code editing
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/DoxygenToolkit.vim'

" system clipboard
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" cpp related
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

" log file
Plug 'mtdl9/vim-log-highlighting'

" markdown
Plug 'preservim/vim-markdown'

" Fzf tags and etc
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()
" ---- end of All plugins here ----

" ---- Common settings ----
let c_no_curly_error=1
let g:tex_conceal=''
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
noremap <leader>wj :silent horizontal resize +5<CR>
noremap <leader>wk :silent horizontal resize -5<CR>
noremap <leader>wl :silent vertical resize +5<CR>
noremap <leader>wh :silent vertical resize -5<CR>
" ---- end of Common settings ----

" ---- Windows settings ----
if has('win32')
    set guifont=Consolas:h12
    au GUIEnter * simalt ~x
elseif has('mac')
    set guifont=Menlo:h15
endif
set go-=T
set go-=r
set go-=L
set go-=m
" ---- end of Windows settings ----

" ---- Color scheme ----
set t_Co=256
set t_ut=
set background=dark
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
silent! colorscheme gruvbox
hi Visual cterm=none ctermfg=gray ctermbg=blue gui=none guifg=gray guibg=blue
hi! link Error Normal
" ---- end of Color scheme ----

" ---- Airline ----
let g:airline_symbols_ascii=1
let g:airline_powerline_fonts=0
let g:airline#extensions#gutentags#enabled=1
" ---- end of Airline ----

" ---- Fugitive settings ----
noremap <C-G> :Git<CR>
" ---- end of Fugitive settings ----

" ---- Editorconfig settings ----
let g:EditorConfig_preserve_formatoptions=1
let g:EditorConfig_max_line_indicator='fill'
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

" ---- Switch header/source ----
let g:alternateNoDefaultAlternate=1
noremap <C-H> :silent A<CR>\|:e<CR>
" ---- end of Switch header/source ----

" ---- Yank to clipboard ----
vnoremap <leader>y :OSCYankVisual<CR>
" ---- end of Yank to clipboard ----

" ---- C++ highlights settings ----
let g:cpp_class_scope_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_member_variable_highlight=0
let g:cpp_posix_standard=1
" ---- end of C++ highlights settings ----

" ---- NERDTree settings ----
let g:NERDTreeWinSize=40
let g:NERDTreeMinimalMenu=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeGitStatusUseNerdFonts=0
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
function OpenTree()
    if bufname('%') == ''
        :silent! NERDTreeToggle
    else
        :silent! NERDTreeFind
    endif
endfunction
noremap <C-J> :call OpenTree()<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute 'normal! \<C-W>w' | execute 'buffer'.buf | endif
" ---- end of NERDTree settings ----

" ---- Find in files settings ----
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize='50%'
let g:ctrlsf_auto_focus={'at':'start'}
noremap <leader>j :CtrlSFToggle<CR>
noremap <leader>h :CtrlSF<SPACE>
" ---- end of Find in files settings ----

" ---- Format ----
noremap C :Neoformat<CR>
" ---- end of Format ----

" ---- Tags searcher settings ----
set tags=./.tags;,.tags
let g:gutentags_project_root=['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile='.tags'
let s:vim_tags=expand('~/.cache/tags')
let g:gutentags_cache_dir=s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_generate_on_new=1
let g:gutentags_generate_on_empty_buffer=1
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
let g:gutentags_ctags_extra_args+=['--c-kinds=+px']
let g:gutentags_ctags_extra_args+=['--output-format=e-ctags']
let g:fzf_tags_command=''
" ---- Shortcuts ----
noremap <leader>f :Rg<CR>
noremap <leader>l :Rg <C-R><C-W><CR>
noremap <leader>o :BTags<CR>
noremap <leader>g :Tags<CR>
noremap <leader>b :Buffers<CR>
noremap <C-P> :Files<CR>
" ---- end of Tags searcher settings ----
