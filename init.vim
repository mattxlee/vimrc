" ---- All plugins here ----
call plug#begin()

" theme
Plug 'morhetz/gruvbox'

" layouts
Plug 'vim-airline/vim-airline'

" switch header/source
Plug 'vim-scripts/a.vim'

" git related
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

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

" copy/paste with system clipboard
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

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
let g:gruvbox_contrast_dark='medium'
silent! colorscheme gruvbox
hi! link Error Normal
hi! link SignColumn LineNr
" ---- end of Color scheme ----

" ---- Airline ----
let g:airline_symbols_ascii=1
let g:airline_powerline_fonts=0
" ---- end of Airline ----

" ---- Editorconfig settings ----
let g:EditorConfig_preserve_formatoptions=1
let g:EditorConfig_max_line_indicator='fill'
" ---- end of Editorconfig settings ----

" ---- StripWhitespaces settings ----
noremap <leader>x :StripWhitespace<CR>
" ---- end of StripWhitespaces settings ----

" ---- Format settings ----
noremap <leader>i :Neoformat<CR>
let g:neoformat_rust_rustfmt = {
    \ 'exe': 'rustfmt',
    \ 'args': ['--edition=2024'],
    \ 'replace': 1
    \ }
let g:neoformat_enabled_rust = ['rustfmt']
" ---- end of Format settings ----

" ---- Json settings ----
let g:vim_json_conceal=0
" ---- end of Json settings ----

" ---- Switch to next window ----
noremap <leader>w <C-W>w
noremap <leader>W <C-W>W
" ---- end of Switch

" ---- Switch between header/source
let g:alternateNoDefaultAlternate=1
noremap <C-H> :silent A<CR>\|:e<CR>
" ---- end of Switch between header/source

" ---- File explorer shortcuts ----
noremap <leader>s :sp<CR>
noremap <leader>v :vs<CR>
noremap <C-J> :Expl<CR>
" ---- end of File explorer shortcuts ----

" ---- Quickfix settings ----
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

" ---- Git related settings ----
noremap <C-G> :Git<CR>
" ---- end of Git related settings ----

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
" ---- end of Vim tags settings ----

" ---- FzF settings ----
let g:fzf_vim={}
let g:fzf_vim.preview_window=[]
let g:fzf_layout={'down':'20%'}
noremap <c-p> :Files<CR>
noremap <leader>o :BTags<CR>
noremap <leader>g :Tags<CR>
noremap <leader>f :Rg<CR>
noremap <leader>l :Rg <C-R><C-W><CR>
noremap <leader>b :Buffers<CR>
noremap <leader>e :GFiles?<CR>

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list') }
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
" ---- end of FzF settings ----

" ---- OSCYank settings ----
nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual
" ---- end of OSCYank settings ----
