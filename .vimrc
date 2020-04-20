"===================================================================================================
" ___    ______________  ___                     ____________
" __ |  / /___  _/__   |/  /  ______________________  __/__(_)______ ____  _____________
" __ | / / __  / __  /|_/ /   _  ___/  __ \_  __ \_  /_ __  /__  __ `/  / / /_  ___/  _ \
" __ |/ / __/ /  _  /  / /    / /__ / /_/ /  / / /  __/ _  / _  /_/ // /_/ /_  /   /  __/
" _____/  /___/  /_/  /_/     \___/ \____//_/ /_//_/    /_/  _\__, / \__,_/ /_/    \___/
"                                                            /____/
"
" !!!Please use NeoVim!!!
"
" Github: https://github.com/mattxlee/vimrc
" Contact me at mattxlee@gmail.com
"===================================================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

set background=dark

" ==== Gruvbox colorscheme ====
let g:gruvbox_contrast_dark='medium'
Plug 'morhetz/gruvbox'

" ==== Rainbow ====
let g:rainbow_active=1
let g:rainbow_conf={
\	'operators': '_,\|&\|*\|=\|-\|>\|<\||\|:\|\._',
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'css': 0,
\       'cmake': 0,
\	}
\}
Plug 'luochen1990/rainbow'

" ==== Project support ====
Plug 'editorconfig/editorconfig-vim' "Editor config file manager

" ==== Local .lvimrc file support ===
let g:localvimrc_ask=0
Plug 'embear/vim-localvimrc' "Load .lvimrc file on startup

" ==== TODO Or make DOC comments ====
Plug 'vim-scripts/TaskList.vim' "<Leader>t to show all TODO tag of current file
Plug 'fadein/vim-FIGlet' "figlet command to generate text with fonts

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

" ==== Quick jump for files ====
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
Plug 'gregsexton/gitv' "git tree view

" ==== Syntax support ====
Plug 'ekalinin/Dockerfile.vim' "Dockerfile syntax
Plug 'uarun/vim-protobuf' "protobuf file highlights
Plug 'hdima/python-syntax' "Enhance python syntax display
Plug 'ap/vim-css-color' "VIM css color preview

" ==== Markdown support ====
Plug 'godlygeek/tabular'

let g:vim_markdown_folding_disabled=1
Plug 'plasticboy/vim-markdown'

" ==== Solidity compiler support ====
Plug 'dmdque/solidity.vim'
Plug 'tomlion/vim-solidity' "Solidity syntax support

" ==== Javascript syntax support ====
let g:javascript_plugin_jsdoc=1
Plug 'pangloss/vim-javascript' "Enhance javascript syntax display

" ==== React syntax support ====
let g:jsx_ext_required=0
Plug 'mxw/vim-jsx' "Enhance react js syntax display

" ==== Typescript syntax support ====
Plug 'leafgarland/typescript-vim' "TypeScript language support

" ==== C++ syntax enhanced ====
let g:c_no_curly_error=1
Plug 'octol/vim-cpp-enhanced-highlight' "C++ syntax highlighting

" ==== HTML tag pair match ====
let g:mta_filetypes = {
    \ 'html': 1,
    \ 'xhtml': 1,
    \ 'xml': 1,
    \ 'jinja': 1,
    \ 'javascript': 1,
    \ 'vue': 1,
    \}
Plug 'Valloric/MatchTagAlways' "Show the match tags

" ==== VUE syntax support ====
Plug 'posva/vim-vue' "Show VUE syntax

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
Plug 'mhinz/vim-startify'

" ==== Nerd icons replacement ====
Plug 'ryanoasis/vim-devicons'

" ==== Coc ====
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> ge <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap mm <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" All of your Plugs must be added before the following line
call plug#end()

syntax enable

silent! colorscheme gruvbox

filetype indent off
set autoindent

set guifont=RobotoMono\ Nerd\ Font:h14

set hidden
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

set signcolumn=yes
set cmdheight=2
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
set updatetime=300
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
nmap <C-J> :NERDTree<CR>
nmap <C-H> :A<CR>
nmap <C-L> :CtrlSF -G .*
nmap <C-G> :Gstatus<CR>
nmap <C-T> :TrailerTrim<CR>
nmap L :CtrlSFToggle<CR>
nmap * :keepjumps normal! mi*`i<CR>
nmap N :noh<CR>
nmap Y <C-W>w
nmap M :make<CR>:copen<CR>
nmap Q :q<CR>

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
