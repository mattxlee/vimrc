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

" Disallow NeoVIM changes the cursor
set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
autocmd OptionSet guicursor noautocmd set guicursor=

" ==== Gruvbox colorscheme ====
let g:gruvbox_contrast_dark='soft'
Plug 'morhetz/gruvbox'

" ==== Project support ====
Plug 'editorconfig/editorconfig-vim' "Editor config file manager

" ==== Local .lvimrc file support ===
let g:localvimrc_ask=0
Plug 'embear/vim-localvimrc' "Load .lvimrc file on startup

" ==== TODO Or make DOC comments ====
Plug 'vim-scripts/TaskList.vim' "<Leader>t to show all TODO tag of current file

" ==== Global search ====
let g:ctrlsf_ackprg='ag'
let g:ctrlsf_regex_pattern=0
let g:ctrlsf_default_root='project'
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize='30%'
let g:ctrlsf_search_mode='async'
let g:ctrlsf_ignore_dir=['node_modules']
let g:ctrlsf_auto_focus={
    \ "at": "start"
    \ }
let g:ctrlsf_extra_root_markers=['.project', '.root', '.svn', '.git']
Plug 'rking/ag.vim' "quick find, ctrlsf.vim depends on it
Plug 'dyng/ctrlsf.vim' "ctrl+l to search in files

" ==== File tree control ====
let g:NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=47
Plug 'preservim/nerdtree' "ctrl+j to open it

" ==== Switch header/source ====
Plug 'mattxlee/vim-fswitch'

" ==== Quick jump to files ====
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore='\v[\/](node_modules)|(\.(git|hg|svn|DS_Store))$'
Plug 'ctrlpvim/ctrlp.vim'

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
let g:vim_jsx_pretty_highlight_close_tag=1
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'

" ==== Typescript syntax support ====
Plug 'leafgarland/typescript-vim' "TypeScript language support
Plug 'peitalin/vim-jsx-typescript' "Typescript (tsx)

" ==== C++ syntax enhanced ====
let g:c_no_curly_error=1

" ==== Status line ====
let g:airline_powerline_fonts=0
let g:airline#extensions#fugitiveline#enabled=1
let g:airline#extensions#ycm#enabled=1
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
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
if !isdirectory(s:vim_tags)
  silent! call mkdir(s:vim_tags, 'p')
endif
Plug 'ludovicchabant/vim-gutentags' "Building tags

" ==== Quick jump for tags ====
let g:Lf_ShortcutB='<Leader>n'
let g:Lf_WildIgnore={
    \ 'dir': ['.svn','.git','.hg','node_modules'],
    \ 'file': ['*.sw?','*.bak','*.exe','*.o','*.so']
    \}
let g:Lf_StlSeparator={'left': '', 'right': '', 'font': ''}
let g:Lf_RootMarkers=['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_CacheDirectory=expand('~/.vim/cache')
let g:Lf_ShowRelativePath=0
let g:Lf_PreviewResult={'Function':0, 'BufTag':0}
let g:Lf_WindowPosition='popup'
let g:Lf_PreviewInPopup=1
let g:Lf_ShortcutF='<C-P>'
let g:Lf_ShowDevIcons=0
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}

" ==== Code formatting ====
let g:neoformat_enabled_javascript=['prettier']
Plug 'sbdchd/neoformat' "Format source

" ==== You complete me ====
nmap gd :YcmCompleter GoTo<CR>
nmap gh :YcmCompleter GetDoc<CR>
nmap gr :YcmCompleter GoToReferences<CR>
nmap ge :YcmDiags<CR>
let g:syntastic_error_symbol='x'
let g:syntastic_warning_symbol='?'
let g:ycm_auto_trigger=0
let g:ycm_add_preview_to_completeopt='1'
let g:ycm_auto_hover=''
Plug 'ycm-core/YouCompleteMe'

" ==== Run command in async mode ====
let g:asyncrun_open=10
Plug 'skywind3000/asyncrun.vim'

" All of your Plugs must be added before the following line
call plug#end()

syntax enable

silent! colorscheme gruvbox
set termguicolors
set guifont=Consolas:h13

set hidden
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

set smartindent
set autoindent
set cinkeys-=:

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
set nobackup
set noswapfile
set ignorecase
set incsearch
set timeoutlen=999
set tags=./.tags;,.tags

let mapleader=";"

nmap C :Neoformat<CR>
nmap <Leader>f :LeaderfFunction<CR>
nmap <Leader>g :LeaderfTag<CR>
nmap <Leader>V :sp<CR>
nmap <Leader>v :vsp<CR>
nmap <Leader>o :vertical resize 130<CR>
nmap <Leader>h :winc =<CR>
nmap <Leader>c :term ++curwin<CR>
nmap <C-L> :CtrlSF<Space>
nmap <C-G> :Git<CR>
nmap <C-T> :TrailerTrim<CR>
nmap <C-H> :FSHere<CR>
nmap L :CtrlSFToggle<CR>
nmap * :keepjumps normal! mi*`i<CR>
nmap N :noh<CR>
nmap Y <C-W>w
nmap Q :q<CR>

nmap M :cclose<CR>:lclose<CR>:pclose<CR>
noremap mk :AsyncRun make -j9<CR>
noremap gu :AsyncRun git push<CR>

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

" No beep
set vb t_vb=
set viminfo+=n~/.nvim/tmpfiles/viminfo

hi Visual cterm=NONE gui=NONE
hi SignColumn cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
hi GruvboxRedSign ctermfg=167 ctermbg=NONE guifg=#fb4934 guibg=NONE
hi GruvboxGreenSign ctermfg=142 ctermbg=NONE guifg=#b8bb26 guibg=NONE
hi GruvboxYellowSign ctermfg=214 ctermbg=NONE guifg=#fabd2f guibg=NONE
hi GruvboxBlueSign ctermfg=109 ctermbg=NONE guifg=#83a598 guibg=NONE
hi GruvboxPurpleSign ctermfg=175 ctermbg=NONE guifg=#d3869b guibg=NONE
hi GruvboxAquaSign ctermfg=108 ctermbg=NONE guifg=#8ec07c guibg=NONE
