" ---- All plugins here ----
call plug#begin()
Plug 'vim-scripts/a.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/LeaderF'
Plug 'Yggdroot/indentLine'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'eugen0329/vim-esearch'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tomtom/tcomment_vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'preservim/vim-markdown'
Plug 'bfrg/vim-cpp-modern'
Plug '907th/vim-auto-save'
Plug 'mhinz/vim-startify'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
if has('nvim')
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
else
    Plug 'easymotion/vim-easymotion'
endif
call plug#end()
" ---- end of All plugins here ----

" ---- Common settings ----
let c_no_curly_error=1
set mouse=
set nu
set ignorecase
set smartcase
set noshowmode
set showtabline=0
set updatetime=666
set nocursorline
set hlsearch
set linebreak
set breakindent
set breakindentopt=shift:4
set nobackup
set nowritebackup
set noswapfile
set signcolumn=number
if has('termguicolors')
    set termguicolors
endif
set nocindent
set autoindent
set nosmartindent
filetype indent off
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" ---- Common shortcuts ----
let mapleader='\'
noremap N :noh<CR>
noremap * :keepjumps normal! mi*`i<CR>
noremap <Leader>s :sp<CR>
noremap <Leader>v :vsp<CR>
noremap <Leader>w <c-w>w
noremap <Leader><Leader>d :BufOnly<CR>
" ---- end of Common settings ----

" ---- Windows settings ----
set guifont=Consolas:h12
au GUIEnter * simalt ~x
set go-=T
set go-=r
set go-=L
set go-=m
" ---- end of Windows settings ----

" ---- Color scheme ----
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
set background=dark
silent! colorscheme gruvbox
" ---- end of Color scheme ----

" ---- Startify settings ----
let g:startify_change_to_dir=1
let g:startify_change_to_vcs_root=1

" ---- Airline ----
let g:airline_symbols_ascii=1
let g:airline_powerline_fonts=0
" ---- end of Airline ----

" ---- TrailerTrim settings ----
noremap <Leader>t :StripWhitespace<CR>
" ---- end of TrailerTrim settings ----

" ---- Fugitive settings ----
noremap <C-G> :Git<CR>
" ---- end of Fugitive settings ----

" ---- CTags settings ----
let g:gutentags_project_root=['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_generate_on_empty_buffer=1
let g:gutentags_generate_on_missing=1
let s:vim_tags=expand('~/.cache/tags')
let g:gutentags_ctags_exclude=['node_modules', '.ccls-cache']
let g:gutentags_cache_dir=s:vim_tags
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
let g:gutentags_ctags_extra_args+=['--c-kinds=+px']
let g:gutentags_exclude_filetypes=['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
" ---- end of CTags settings ----

" ---- LeaderF related settings ----
let g:Lf_WindowPosition='popup'
let g:Lf_PreviewInPopup=1
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
noremap <Leader>o :LeaderfFunction<CR>
noremap <Leader>g :LeaderfTag<CR>
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

" ---- Toggle quick-fix pane ----
autocmd filetype qf wincmd J
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> M :call ToggleQuickFix()<cr>
" ---- end of Toggle quick-fix pane ----

" ---- AsyncRun settings ----
let g:asyncrun_open=10
let g:asyncrun_bell=1
noremap gu :Git push<CR>
noremap <C-K> :AsyncStop<CR>
function Build()
    if !empty(expand(glob("Makefile")))
        :AsyncRun make
    else
        :AsyncRun cmake --build ./build --config debug
    endif
endfunction
function Clean()
    if !empty(expand(glob("Makefile")))
        :AsyncRun make clean
    else
        :AsyncRun cmake --build ./build --target clean
    endif
endfunction
noremap mk :call Build()<CR>
noremap mn :call Clean()<CR>
noremap <Leader>n :cn<CR>
noremap <Leader>p :cp<CR>
" ---- end of AsyncRun settings ----

" ---- IndentLine settings ----
let g:indentLine_char='▏'
" ---- end of IndentLine settings ----

" ---- Auto save ----
let g:auto_save=1
" ---- end of Auto save ----

" ---- Yank to clipboard ----
vnoremap <leader>y :OSCYank<CR>
" ---- end of Yank to clipboard ----

if has('nvim')
    lua require('init')
endif
