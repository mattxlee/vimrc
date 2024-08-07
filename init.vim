" ---- All plugins here ----
call plug#begin()

" theme
Plug 'morhetz/gruvbox'

" layouts
Plug 'vim-airline/vim-airline'

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
Plug 'Yggdroot/LeaderF'

" easy motion jumping plug
Plug 'easymotion/vim-easymotion'

" run commands async
Plug 'skywind3000/asyncrun.vim'

" ---- Extra file syntax highlighting ----
" log file
Plug 'mtdl9/vim-log-highlighting'
" *.pbxproj
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
filetype indent on
filetype plugin indent on
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

" ---- File explorer shortcuts ----
noremap <leader>s :sp<CR>
noremap <leader>v :vs<CR>
noremap <C-J> :Explore<CR>
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

let the_root=['.root', '.svn', '.git', '.hg', '.project']

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

" ---- LeaderF settings ----
let g:Lf_ShortcutF='<c-p>'
let g:Lf_ShowDevIcons=0
let g:Lf_UseCache=0
noremap <c-l> :LeaderfMru<CR>
noremap <leader>o :LeaderfBufTag<CR>
noremap <leader>g :LeaderfTag<CR>
noremap <leader>f :Leaderf rg --live<CR>
noremap <leader>l :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
let g:Lf_StlSeparator={'left': '', 'right': '', 'font': ''}
let g:Lf_RootMarkers=the_root
let g:Lf_WorkingDirectoryMode='ac'
let g:Lf_WindowHeight=0.30
let g:Lf_CacheDirectory=expand('~/.cache/tags')
let g:Lf_ShowRelativePath=0
let g:Lf_HideHelp=1
let g:Lf_StlColorscheme='powerline'
let g:Lf_PreviewResult={
    \ 'File': 0,
    \ 'Buffer': 0,
    \ 'Mru': 0,
    \ 'Tag': 0,
    \ 'BufTag': 0,
    \ 'Function': 0,
    \ 'Line': 0,
    \ 'Colorscheme': 0,
    \ 'Rg': 0,
    \ 'Gtags': 0
    \}
" ---- end of LeaderF settings ----
