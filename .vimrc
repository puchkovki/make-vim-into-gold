" VIM CONFIGURATION
"------------------

" PLUGINS
"------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Brackets
Plug 'Raimondi/delimitMate'
Plug 'frazrepo/vim-rainbow'

" NERDTree
Plug 'scrooloose/nerdtree'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/a.vim'
Plug 'ervandew/supertab'

" Fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Tags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" Git
Plug 'airblade/vim-gitgutter'

" Indents
Plug 'Yggdroot/indentLine'
Plug 'jpalardy/spacehi.vim'

call plug#end()

" OTHER
"------------------

" --WORKDIR--
set dir=~/.vim

" --BACKUP--
set backup
set backupdir=/tmp
set noswapfile
set autoread

" --FILETYPE--
filetype on
filetype plugin on
filetype indent on

" --UNDO--
set undofile
set undodir=~/.vim/undo

" --SYNTAX--
syntax on

" --ENCODING--
set termencoding=utf-8
set fileencodings=utf8,cp1251
set encoding=utf8

" --INDENT--
set smarttab
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
let g:spacehi_tabcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"
let g:spacehi_spacecolor="ctermfg=Black ctermbg=Yellow guifg=Blue guibg=Yellow"
let g:spacehi_nbspcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"
set list
set listchars=tab:>>,trail:.,nbsp:×

" --FONT--
set guifont=Fira\ Code:h12

" --LINE-NO--
set number

" --LINESPACE--
set linespace=3

" --CASE--
set ignorecase
set smartcase

" --SEARCH--
set incsearch
set hlsearch

" --MODE--
set showcmd
set showmode

" --RULER--
set ruler

" --COLORS--
set t_Co=256
color slate

" --BRACKETS--
set showmatch
let g:rainbow_ctermfgs = ['lightgreen', 'yellow', 'red', 'magenta']
let g:rainbow_active = 1

" --STOREBUF--
set hidden

" --BACKSPACE--
set backspace=indent,eol,start

" --MOUSE--
set mouse=a
set mousemodel=popup
set mousehide
nnoremap <ScrollWheelDown> j
nnoremap <ScrollWheelUp> k
vnoremap <ScrollWheelDown> j
vnoremap <ScrollWheelUp> k

" --STATUSLINE--
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" --NERDTREE--
" Show the folder tree: ctrl + N
nmap <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" --SYNTASTIC--
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END

" --BELL--
set novisualbell

" --DELIMITMATE--
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --COLUMN--
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" --PATH--
set path+=/usr/include/x86_64-linux-gnu
set path+=~/arcadia
set path+=~/arcadia/contrib/libs/cxxsupp/libcxxrt
set path+=~/arcadia/contrib/libs/cxxsupp/libcxx/include
set path+=~/arcadia/devtools/clang_includes

" --TAGS--
map <F8> :TagBar<CR>

