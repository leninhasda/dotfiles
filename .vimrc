" config
syntax enable

set nocompatible
filetype off

colorscheme stellarized 
set background=dark

set backspace=indent,eol,start

set number

" Dependencies
"   https://github.com/VundleVim/Vundle.vim
"   https://github.com/powerline/fonts


"-------------------------------- GENERAL -------------------------------------"



"set rtp+=~/.vim/bundle/vundle
call plug#begin('~/.vim/plugged')

"Plug 'ap/vim-css-color' "Preview color while editing css
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'digitaltoad/vim-pug' "syntax highlight for pug template
"Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
"Plug 'godlygeek/tabular' "tabularize variable declares

Plug 'itchyny/lightline.vim' "highlights inser/visual/vim mode status bar
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs' "insert or deletes brackets in pair
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree' "sidebar
"Plugin 'tmhedberg/matchit'
"Plugin 'tommcdo/vim-exchange'
"Plugin 'tpope/vim-haml'
"Plugin 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'
"Plugin 'christoomey/vim-tmux-navigator'

" color themes
Plug 'nightsense/stellarized'
Plug 'Siphalor/vim-atomified'
Plug 'neutaaaaan/iosvkem'
Plug 'skreek/skeletor.vim'
Plug 'Jimeno0/vim-chito'
Plug 'TheAtlasEngine/PastelColors'
Plug 'napcs/vim-mycontrast'
Plug 'kaicataldo/material.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'Yggdroot/duoduo'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

call plug#end()

" basic
filetype plugin indent on
syntax on
set lazyredraw

" theme and color
set t_Co=256

" numbering, rulers and highlight
" set relativenumber
set number
set nocursorline
set nocursorcolumn
highlight CursorColumn ctermbg=8
highlight ColorColumn ctermbg=7
highlight Visual ctermbg=255 ctermfg=16

" horizontal limit (ie. colored border, text width)
" TODO toggle textwidth
highlight ColorColumn ctermbg=darkgrey
set colorcolumn=120 " make this 81, shouldn't hit it

" fix normal keys, and lock mouse
set backspace=indent,eol,start
set mouse=

" new window or pane should be appended to bottom right
set splitbelow
set splitright

" handy mapping
set pastetoggle=<leader>p
nnoremap ; :
vnoremap ; :
nnoremap <C-j> gj
nnoremap <C-k> gk
nnoremap <C-^> g^
nnoremap <C-$> g$
nnoremap <C-0> g0
nnoremap <BAR> :set cursorcolumn!<BAR>set cursorline!<CR>
noremap / /\v

if bufwinnr(1)
  " pane resize vertically = -
  " and horizontally + _
  map = 5<c-w>>
  map - 5<c-w><
  map + 5<c-w>+
  map _ 5<c-w>-
endif

" tab stops defaults and modeline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set modeline
set modelines=5

" searching
set showcmd
set hlsearch
set modifiable
set smartcase
set ignorecase
map <space> :noh<cr>

" show hidden chars
"set listchars=tab:>-,trail:.
"set list

" text format
set wrap
set showmatch

" disable swap files
set nobackup
set nowritebackup
set noswapfile

" large file handle
let g:LargeFile = 10 * 1024 * 1024
augroup LargeFile
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END
function! LargeFile()
  set eventignore+=FileType " disable filetype related features
  noswapfile
  setlocal bufhidden=unload " save memory when other file is viewed
  setlocal buftype=nowrite
  setlocal undolevels=1
  autocmd VimEnter *  echo "Entering large-file-mode as file is larger than " . (g:LargeFile / 1024 / 1024) . "MB"
endfunction

" sudo switch with w!!
cmap w!! w !sudo tee % >/dev/null


" neovim
if has('nvim')
  " terminal
  tnoremap <Esc> <C-\><C-n>

  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l

  tnoremap <C-w>H <C-\><C-n><C-w>H
  tnoremap <C-w>J <C-\><C-n><C-w>J
  tnoremap <C-w>K <C-\><C-n><C-w>K
  tnoremap <C-w>L <C-\><C-n><C-w>L

  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
endif


"--------------------------------- PLUGIN -------------------------------------"


" emmet
" @link https://github.com/mattn/emmet-vim
"   tab to expand
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


" exchange
" @link https://github.com/tommcdo/vim-exchange
let g:exchange_no_mappings=1
nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)


" ctrlp
" @link https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 0
set wildignore+=*/vendors/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**

" gundo
" @link https://github.com/sjl/gundo.vim
" let g:gundo_right=1
" let g:gundo_close_on_revert = 1
" let g:gundo_preview_height=25
" nnoremap <leader>u :GundoToggle<cr>


" indent line
" @link https://github.com/Yggdroot/indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'


" light line
" @link https://github.com/itchyny/lightline.vim
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'one', 
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'readonly', 'filename', 'modified' ]
\   ],
\   'right': [
\     [ 'lineinfo' ],
\     [ 'percent' ],
\     [ 'fileformat', 'fileencoding', 'filetype' ]
\   ]
\ },
\ 'component_function': {
\   'readonly': 'LightlineReadonly',
\   'modified': 'LightlineModified',
\   'filename': 'LightlineFilename',
\ },
\ 'separator': { 'left': '|', 'right': '|'  },
\ 'subseparator': { 'left': '|', 'right': '|'  }
\ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
  \ ('' != expand('%:t') ? expand('%:t') : '[Unnamed]') .
  \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction


" nerdtree
" @link https://github.com/scrooloose/nerdtree
"   Ctrl + N to toggle
"   and show-on folder open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"--------------------------------- EXTRA -------------------------------------"

" load local vimrc, if any
silent! source ~/.vimrc.local

" vim git changes
let g:gitgutter_avoid_cmd_prompt_on_windows = 0

" git status
"let g:airline#extensions#tabline#enabled = 1
" php autocomplete
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"line moving
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"ctrl+s to save
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a

"ctrl+a to select all
map <C-a> <esc>ggVG<CR>

"ctrl+w to close buffer
map <C-w> <esc>:bd<CR>

"ctrl+alt+w to close/exit vim
map <C-A-w> <esc>:qa<CR>

"ctrl+ c,x,v,y,z global mode
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
