" ---- All plugins here ----
call plug#begin()

" theme
Plug 'morhetz/gruvbox'

" c/cpp switching header/source
Plug 'vim-scripts/a.vim'

" ctrlp and global search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'

" enhance syntax
Plug 'octol/vim-cpp-enhanced-highlight'

" layouts
Plug 'vim-airline/vim-airline'

" jumping
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" easy to jump anywhere
Plug 'easymotion/vim-easymotion'

" git related
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" format and etc.
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'

" common code editing
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/DoxygenToolkit.vim'

" log file
Plug 'mtdl9/vim-log-highlighting'

" ALE lint
Plug 'dense-analysis/ale'

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
set smartindent
" the following line turn off the auto add comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=mM
autocmd FileType c,cpp,objc set nocindent
" limit the auto-complete entries
set complete=.,w,b,u,t
" ---- Common shortcuts ----
set cmdheight=1
noremap K :on<CR>
noremap * :keepjumps normal! mi*`i<CR>
noremap <leader>h :silent vertical resize 130<CR>
noremap <leader>n :noh<CR>
noremap <leader>c :cclose<CR>
noremap <leader>q :qa<CR>
noremap K :on<CR>
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
let g:gruvbox_contrast_dark='middle'
silent! colorscheme gruvbox
hi! link Error Normal
hi Visual term=None cterm=None gui=None ctermbg=239
" ---- end of Color scheme ----

" ---- Airline ----
let g:airline_symbols_ascii=1
let g:airline_powerline_fonts=0
let g:airline#extensions#ale#enabled=1
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

" ---- StripWhitespaces settings ----
noremap <leader>x :StripWhitespace<CR>
" ---- end of StripWhitespaces settings ----

" ---- Json settings ----
let g:vim_json_conceal=0
" ---- end of Json settings ----

" ---- Switch header/source ----
let g:alternateNoDefaultAlternate=1
noremap <C-H> :silent A<CR>\|:e<CR>
" ---- end of Switch header/source ----

" ---- Switch to next window ----
noremap <leader><leader> <C-W>W
" ---- end of Switch

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

" ---- Easy motion settings ----
let g:EasyMotion_do_mapping=0 " Disable default mappings
let g:EasyMotion_smartcase=1
nmap s <Plug>(easymotion-overwin-f)
" ---- end of Easy motion settings ----

" ---- ALE lint settings ----
let g:ale_completion_enabled=0
let g:ale_virtualtext_cursor='disabled'
let g:ale_sign_error='x'
let g:ale_sign_warning='?'
noremap gd :ALEGoToDefinition<CR>
noremap gr :ALEFindReferences<CR>
noremap gh :ALEHover<CR>
noremap ]d :ALENext<CR>
noremap [d :ALEPrevious<CR>
noremap <leader>d :ALEDetail<CR>
noremap <leader>rn :ALERename<CR>
noremap <leader>ca :ALECodeAction<CR>
inoremap <silent><c-l> <c-\><c-o>:ALEComplete<CR>
" ---- end of ALE lint settings ----

" ---- Rg settings ----
let g:rg_command='rg --vimgrep -S'
noremap <leader>f :Rg<space>
noremap <leader>l :Rg<space><cword><CR>
noremap <leader>j :cnext<CR>
noremap <leader>k :cprev<CR>
" ---- end of Rg settings ----

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
