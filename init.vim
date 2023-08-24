" ---- All plugins here ----
call plug#begin()

" theme
Plug 'morhetz/gruvbox'

" layouts
Plug 'vim-airline/vim-airline'

" jumping
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" global search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eugen0329/vim-esearch'

" easy to jump anywhere
Plug 'easymotion/vim-easymotion'

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
Plug 'Eliot00/auto-pairs'

" system clipboard
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" c/cpp switch header/source
Plug 'vim-scripts/a.vim'

" log file
Plug 'mtdl9/vim-log-highlighting'

" markdown
Plug 'preservim/vim-markdown'

" React Jsx
Plug 'maxmellon/vim-jsx-pretty'

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
" about how to turn auto indent off
set autoindent
set smartindent
" the following line turn the auto add comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=mM
autocmd BufEnter *.cpp :setlocal cindent cino=j1,(0,ws,Ws
" limit the auto-complete entries
set complete=.,w,b,u,t
" ---- Common shortcuts ----
set cmdheight=1
let mapleader=';'
noremap K :on<CR>
noremap * :keepjumps normal! mi*`i<CR>
noremap <leader>wj :silent horizontal resize +5<CR>
noremap <leader>wk :silent horizontal resize -5<CR>
noremap <leader>wl :silent vertical resize +5<CR>
noremap <leader>wh :silent vertical resize -5<CR>
noremap <leader>h  :silent vertical resize 130<CR>
noremap <leader>q :qa<CR>
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
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark="middle"
silent! colorscheme gruvbox
hi Visual cterm=none ctermfg=gray ctermbg=blue gui=none guifg=gray guibg=blue
hi! link Error Normal
" ---- end of Color scheme ----

" ---- Airline ----
let g:airline_symbols_ascii=1
let g:airline_powerline_fonts=0
" ---- end of Airline ----

" ---- Fugitive settings ----
noremap <C-G> :Git<CR>
noremap <leader>u :Git push<CR>
noremap <leader>p :Git pull --rebase<CR>
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

" ---- Switch to next window ----
noremap <leader><leader> <C-W>W
" ---- end of SwitchABCDEFGHIJKLMNOPQRSTUVWXYZ

" ---- Yank to clipboard ----
vnoremap <leader>y :OSCYankVisual<CR>
" ---- end of Yank to clipboard ----

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
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute 'normal! \<C-W>w' | execute 'buffer'.buf | endif
" ---- end of NERDTree settings ----

" ---- Format ----
noremap C :Neoformat<CR>
" ---- end of Format ----

" ---- Easy motion settings ----
let g:EasyMotion_do_mapping=0 " Disable default mappings
let g:EasyMotion_smartcase=1
nmap s <Plug>(easymotion-overwin-f)
" ---- end of Easy motion settings ----

" ---- esearch settings ----
noremap <leader>f <plug>(esearch)
noremap <leader>l <plug>(operator-esearch-exec)iw
" settings
let g:esearch={}
" Use regex matching with the smart case mode by default and avoid matching text-objects.
let g:esearch.regex=0
let g:esearch.textobj=0
let g:esearch.case='smart'
" Set the initial pattern content using the highlighted '/' pattern (if
" v:hlsearch is true), the last searched pattern or the clipboard content.
let g:esearch.prefill=['last']
" Override the default files and directories to determine your project root. Set it
" to blank to always use the current working directory.
let g:esearch.root_markers=['.git', 'Makefile', 'node_modules']
" Prevent esearch from adding any default keymaps.
let g:esearch.default_mappings=1
" Start the search only when the enter is hit instead of updating the pattern while you're typing.
let g:esearch.live_update=1
" Open the search window in a vertical split and reuse it for all further searches.
let g:esearch.name='[esearch]'
" ---- end of esearch settings ----

" ---- CtrlP settings ----
let g:ctrlp_switch_buffer='et'
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command='rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching=0
else
    let g:ctrlp_clear_cache_on_exit=0
endif
" ---- end of CtrlP settings ----
