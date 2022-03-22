" -----------------------------------------------------------------------------
"  GENERAL SETTINGS
" -----------------------------------------------------------------------------
""" turn off backups and undo-files
set nobackup "set backupdir=~/.vim/backup
set noundofile
set noswapfile

""" turn off annoying windows system bleeps
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
set belloff=all

""" set indent plugin rules
filetype plugin indent on
set nocompatible
set autoindent
set nomodeline " disable modeline vulnerability
set foldcolumn=4

""" rules for file tabs
set showtabline=1 " 1 - show only if there are multiple tabs
                  " 2 - show always

""" text encoding
set encoding=utf8

""" use 4 spaces for tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set backspace=indent,eol,start
set hidden
set laststatus=2

""" set linenumbers
set number " set relativenumber
set nowrap

""" set column ruler at 100
set ruler
set colorcolumn=72,79 " PEP8 suggests 79 for single lines and 72 for blocks

""" set highlight searching
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase

set autoread " autoread files
set mouse=a " use mouse for scroll or window size

""" set folding rules
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

""" set netrw preferences
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" -----------------------------------------------------------------------------
"  APPEARANCE
" -----------------------------------------------------------------------------
set guifont=consolas:h10
set guioptions=c
set background=dark
syntax on

set termguicolors " enable true colors support
"set t_Co=256 " set terminal to use 256 colours

""" jellybeans theme
colo jellybeans
if has('gui')
    let g:airline_theme='jellybeans'
endif

" -----------------------------------------------------------------------------
"  PLUGINS (uses vim-plug)
" -----------------------------------------------------------------------------
""" Intallation instructions:
""" 
""" copy plug.vim to ~/vimfiles/autoload
""" :source ~/_vimrc (:source %)
""" :PlugInstall

""" specify Plugin download directory.
call plug#begin('~/vimfiles/plugged')

Plug 'scrooloose/nerdtree'
Plug 'nanotech/jellybeans.vim'
Plug 'ayu-theme/ayu-vim'
if has('gui')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
endif

call plug#end()

" -----------------------------------------------------------------------------
"  PLUGIN SETTINGS
" -----------------------------------------------------------------------------
""" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""" Airline
if has('gui')
    set showtabline=2 " always show tabs
    let g:bufferline_echo = 1 " turn airline on

    let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
    let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js
endif

""" Ayu dark theme
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
if has('gui')
    let g:airline_theme='ayu_dark'
endif
