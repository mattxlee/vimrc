" ---- All plugins here ----
call plug#begin()

" theme
Plug 'morhetz/gruvbox'

" layouts
Plug 'vim-airline/vim-airline'

" jumping
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" switch header/source
Plug 'vim-scripts/a.vim'

" git related
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" format and etc.
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'

" Neoformat format code
Plug 'sbdchd/neoformat'

" common code editing
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/DoxygenToolkit.vim'

" tags
Plug 'ludovicchabant/vim-gutentags'

" fuzzy search and more
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" easy motion jumping plug
Plug 'easymotion/vim-easymotion'

" run commands async
Plug 'skywind3000/asyncrun.vim'

" ---- Extra file syntax highlighting ----
" c++ files
Plug 'bfrg/vim-cpp-modern'
" dart files
Plug 'dart-lang/dart-vim-plugin'
" log file
Plug 'mtdl9/vim-log-highlighting'
" pbxproj
Plug 'cfdrake/vim-pbxproj'
" ---- end of Extra file syntax highlighting ----

call plug#end()
" ---- end of All plugins here ----

" ---- Common settings ----
let mapleader=';'
let c_no_curly_error=1
let g:tex_conceal=''
set maxmempattern=2000000
set mouse=
set re=0
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
set signcolumn=yes
set cursorline
" about how to turn auto indent off
set autoindent
set nocindent
filetype indent off
filetype plugin indent off
" the following line turn off the auto add comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=mM
" limit the auto-complete entries
set complete=.,w,b,u,t
" ---- Common shortcuts ----
set cmdheight=1
noremap K :on<CR>
noremap * :keepjumps normal! mi*`i<CR>
noremap <leader>n :noh<CR>
vnoremap <leader>c "*y

" ---- end of Common settings ----

" ---- Markdown file settings ----
autocmd FileType markdown set breakat=
autocmd FileType markdown set nobreakindent
" ---- end of Markdown file settings ----

" ---- ejs to html ----
au BufNewFile,BufRead *.ejs set filetype=html
" ---- end of ejs to html ----

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
let g:gruvbox_contrast_dark='middle'
silent! colorscheme gruvbox
hi! link Error Normal
hi Visual term=None cterm=None ctermbg=239
hi SignColumn term=None cterm=None ctermbg=235
" ---- end of Color scheme ----

" ---- Airline ----
let g:airline_symbols_ascii=1
let g:airline_powerline_fonts=0
" ---- end of Airline ----

" ---- Fugitive settings ----
noremap <C-G> :Git<CR>
" ---- end of Fugitive settings ----

" ---- Editorconfig settings ----
let g:EditorConfig_preserve_formatoptions=1
let g:EditorConfig_max_line_indicator='fill'
" ---- end of Editorconfig settings ----

" ---- StripWhitespaces settings ----
noremap <leader>x :StripWhitespace<CR>
" ---- end of StripWhitespaces settings ----

" ---- Format settings ----
noremap <leader>t :Neoformat<CR>
" ---- end of Format settings ----

" ---- Json settings ----
let g:vim_json_conceal=0
" ---- end of Json settings ----

" ---- Switch to next window ----
noremap <leader>w <C-W>W
" ---- end of Switch

" ---- Switch between header/source
let g:alternateNoDefaultAlternate=1
noremap <C-H> :silent A<CR>\|:e<CR>

" ---- NERDTree settings ----
let g:NERDTreeWinSize=40
let g:NERDTreeMinimalMenu=1
let g:NERDTreeQuitOnOpen=0
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
noremap <leader>b :NERDTreeToggle<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute 'normal! \<C-W>w' | execute 'buffer'.buf | endif
" ---- end of NERDTree settings ----

" ---- File explorer shortcuts ----
noremap <leader>s :sp<CR>
noremap <leader>v :vs<CR>
" ---- end of File explorer shortcuts ----

" ---- Quickfix settings ----
noremap <leader>mk :copen \| :AsyncRun! make<CR>
noremap <leader>cb :copen \| :AsyncRun! cmake --build build<CR>
noremap <leader>gu :copen \| :AsyncRun! git push<CR>
noremap <leader>j :cnext<CR>
noremap <leader>k :cprev<CR>
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
noremap <leader>q :call ToggleQuickFix()<CR>
" ensure the quickfix use full width
autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif
" ---- end of Quickfix settings ----

" ---- Define the way to find root dir for projects
let the_root=['.root', '.svn', '.git', '.hg', '.project']
" ---- end of define the way to find root dir for projects

" ---- Vim tags settings ----
set tags=~/.cache/tags
let g:gutentags_project_root=the_root
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_modules=[]
if executable('ctags')
    let g:gutentags_modules+=['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules+=['gtags_cscope']
endif
if executable('rg')
    let g:gutentags_file_list_command='rg --files'
endif
let g:gutentags_cache_dir=expand('~/.cache/tags')
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
let g:gutentags_ctags_extra_args+=['--c-kinds=+px']
let g:gutentags_ctags_extra_args+=['--output-format=e-ctags']
let g:gutentags_auto_add_gtags_cscope=0
if !isdirectory(g:gutentags_cache_dir)
    silent! call mkdir(g:gutentags_cache_dir, 'p')
endif
" ---- Vim tags settings ----

" ---- FzF settings ----
let g:fzf_vim={}
let g:fzf_vim.preview_window=[]
let g:fzf_layout={'down':'20%'}
noremap <c-p> :Files<CR>
noremap <leader>o :BTags<CR>
noremap <leader>g :Tags<CR>
noremap <leader>f :Rg<CR>
noremap <leader>l :Rg <C-R><C-W><CR>
" ---- end of FzF settings ----
