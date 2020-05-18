"===================================================================================================
" ___    ______________  ___                     ____________
" __ |  / /___  _/__   |/  /  ______________________  __/__(_)______ ____  _____________
" __ | / / __  / __  /|_/ /   _  ___/  __ \_  __ \_  /_ __  /__  __ `/  / / /_  ___/  _ \
" __ |/ / __/ /  _  /  / /    / /__ / /_/ /  / / /  __/ _  / _  /_/ // /_/ /_  /   /  __/
" _____/  /___/  /_/  /_/     \___/ \____//_/ /_//_/    /_/  _\__, / \__,_/ /_/    \___/
"                                                            /____/
"
" Github: https://github.com/mattxlee/vimrc
" Contact me at mattxlee@gmail.com
"===================================================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

set background=dark

" ==== Gruvbox colorscheme ====
let g:gruvbox_contrast_dark='hard'
Plug 'morhetz/gruvbox'

" ==== Project support ====
Plug 'editorconfig/editorconfig-vim' "Editor config file manager

" ==== Local .lvimrc file support ===
let g:localvimrc_ask=0
Plug 'embear/vim-localvimrc' "Load .lvimrc file on startup

" ==== TODO Or make DOC comments ====
Plug 'vim-scripts/TaskList.vim' "<Leader>t to show all TODO tag of current file
Plug 'vim-scripts/DoxygenToolkit.vim' "Generate doxy document

" ==== Global search ====
let g:ctrlsf_ackprg='ag'
let g:ctrlsf_regex_pattern=0
let g:ctrlsf_default_root='project'
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize='30%'
let g:ctrlsf_search_mode='async'
let g:ctrlsf_extra_backend_args={
    \ 'ag': '-a'
    \ }
let g:ctrlsf_auto_focus={
    \ "at": "start"
    \ }
let g:ctrlsf_extra_root_markers=['.project', '.root', '.svn', '.git']
Plug 'rking/ag.vim' "quick find, ctrlsf.vim depends on it
Plug 'dyng/ctrlsf.vim' "ctrl+l to search in files

" ==== Quick header/source jump ====
Plug 'micbou/a.vim'

let g:NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=38
Plug 'preservim/nerdtree' "ctrl+j to open it

let g:NERDTreeShowIgnoredStatus=0
let g:NERDTreeIndicatorMapCustom={
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '~',
    \ "Unknown"   : "?"
    \ }
Plug 'Xuyuanp/nerdtree-git-plugin' "Nerd tree with git support

" ==== Quick jump for tags ====
let g:Lf_ShortcutB='<Leader>n'
let g:Lf_WildIgnore={
    \ 'dir': ['.svn','.git','.hg','node_modules'],
    \ 'file': ['*.sw?','*.bak','*.exe','*.o','*.so']
    \}
let g:Lf_StlSeparator={'left': '', 'right': '', 'font': ''}
let g:Lf_RootMarkers=['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_WindowHeight=0.30
let g:Lf_CacheDirectory=expand('~/.vim/cache')
let g:Lf_ShowRelativePath=0
let g:Lf_HideHelp=1
let g:Lf_StlColorscheme='powerline'
let g:Lf_PreviewResult={'Function':0, 'BufTag':0}
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}

" ==== Magic editor ====
Plug 'tpope/vim-surround' "Surround for tags or strings
Plug 'tomtom/tcomment_vim' "gc to make comment of selected lines
Plug 'easymotion/vim-easymotion' "Easy motion

" ==== Unwant spaces ====
Plug 'vim-scripts/ShowTrailingWhitespace' "Show white space characters
Plug 'csexton/trailertrash.vim' "Trim unwanted spaces

" ==== Git support ====
Plug 'airblade/vim-gitgutter' " git status
Plug 'tpope/vim-fugitive' "git command support

" ==== Solidity compiler support ====
Plug 'dmdque/solidity.vim'
Plug 'tomlion/vim-solidity' "Solidity syntax support

" ==== Markdown support ====
let g:vim_markdown_folding_disabled=1
Plug 'plasticboy/vim-markdown'

" ==== Misc Syntax support ====
Plug 'ekalinin/Dockerfile.vim' "Dockerfile syntax
Plug 'uarun/vim-protobuf' "protobuf file highlights
Plug 'hdima/python-syntax' "Enhance python syntax display

" ==== Javascript syntax support ====
let g:javascript_plugin_jsdoc=1
Plug 'pangloss/vim-javascript' "Enhance javascript syntax display

" ==== VUE syntax support ====
Plug 'posva/vim-vue' "Show VUE syntax

" ==== React syntax support ====
let g:jsx_ext_required=0
Plug 'mxw/vim-jsx' "Enhance react js syntax display

" ==== Typescript syntax support ====
Plug 'leafgarland/typescript-vim' "TypeScript language support
Plug 'peitalin/vim-jsx-typescript' "Typescript (tsx)

" ==== C++ syntax enhanced ====
let g:c_no_curly_error=1
Plug 'octol/vim-cpp-enhanced-highlight' "C++ syntax highlighting

" ==== Status line ====
let g:airline_powerline_fonts=0
let g:airline#extensions#fugitiveline#enabled=1
Plug 'vim-airline/vim-airline' "beauty status-bar
Plug 'vim-airline/vim-airline-themes' "beauty status-bar themes

" ==== CTags settings ====
let g:gutentags_project_root=['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_generate_on_empty_buffer=1
let g:gutentags_generate_on_missing=1
let s:vim_tags=expand('~/.cache/tags')
let g:gutentags_ctags_exclude=['node_modules']
let g:gutentags_cache_dir=s:vim_tags
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args+=['--c++-kinds=+px']
let g:gutentags_ctags_extra_args+=['--c-kinds=+px']
let g:gutentags_ctags_extra_args+=['--exclude=node_modules']
let g:gutentags_exclude_filetypes=['gitcommit']
if !isdirectory(s:vim_tags)
  silent! call mkdir(s:vim_tags, 'p')
endif
Plug 'ludovicchabant/vim-gutentags' "Building tags

" ==== Code formatting ====
let g:neoformat_enabled_javascript=['prettier']
Plug 'sbdchd/neoformat' "Format source

" ==== Starts up screen ====
let g:startify_change_to_dir=0
let g:startify_change_to_vcs_root=1
Plug 'mhinz/vim-startify'

" ==== Nerd icons replacement ====
Plug 'ryanoasis/vim-devicons'

" ==== Run command in async mode ====
let g:asyncrun_open=10
Plug 'skywind3000/asyncrun.vim'

" All of your Plugs must be added before the following line
call plug#end()

syntax enable

silent! colorscheme gruvbox

set hidden
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

set signcolumn=yes
set cmdheight=1
set guioptions=
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set nu
set ma
set hls
set cc=0
set laststatus=2
set wrap
set linebreak
set breakindent
set breakindentopt=shift:4
set nolist
set textwidth=0
set wrapmargin=0
set cursorline
set nobackup
set noswapfile
set ignorecase
set incsearch
set updatetime=250
set timeoutlen=3000
set tags=./.tags;,.tags

let mapleader=";"

nmap C :Neoformat<CR>
nmap <Leader><Leader> <C-W>w
nmap <Leader>' <C-W>W
nmap <Leader>f :LeaderfFunction<CR>
nmap <Leader>g :LeaderfTag<CR>
nmap <Leader>V :sp<CR>
nmap <Leader>v :vsp<CR>
nmap <Leader>h :winc =<CR>
nmap <Leader> <Plug>(easymotion-prefix)
nmap <C-H> :A<CR>
nmap <C-L> :CtrlSF -G .*
nmap <C-G> :Gstatus<CR>
nmap <C-T> :TrailerTrim<CR>
nmap <C-P> :LeaderfFile<CR>
nmap L :CtrlSFToggle<CR>
nmap * :keepjumps normal! mi*`i<CR>
nmap N :noh<CR>
nmap Y <C-W>w
nmap M :AsyncRun make -j9<CR>
nmap Q :q<CR>
nmap gd <C-]>

noremap ge :lfirst<CR>
function OpenNERDTree()
    if bufname('%') == ''
        :NERDTree
    else
        :NERDTreeFind
    endif
endfunction

nmap <C-J> :call OpenNERDTree()<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePost,BufWinLeave,BufWinEnter  * GitGutterAll

" Will close vim if there is only a nerdtree window exists
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

hi Visual cterm=NONE gui=NONE
hi SignColumn cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
hi GruvboxRedSign ctermfg=167 ctermbg=NONE guifg=#fb4934 guibg=NONE
hi GruvboxGreenSign ctermfg=142 ctermbg=NONE guifg=#b8bb26 guibg=NONE
hi GruvboxYellowSign ctermfg=214 ctermbg=NONE guifg=#fabd2f guibg=NONE
hi GruvboxBlueSign ctermfg=109 ctermbg=NONE guifg=#83a598 guibg=NONE
hi GruvboxPurpleSign ctermfg=175 ctermbg=NONE guifg=#d3869b guibg=NONE
hi GruvboxAquaSign ctermfg=108 ctermbg=NONE guifg=#8ec07c guibg=NONE
