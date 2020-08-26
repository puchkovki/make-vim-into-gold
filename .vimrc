" VIM CONFIGURATION
"------------------


" PLUGINS
"------------------

" --VUNDLE--
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " Vundle
    Plugin 'VundleVim/Vundle.vim'

    " Status line
    Plugin 'vim-airline/vim-airline'

    " Syntax and autocomplete
    "Plugin 'jeaye/color_coded'
    Plugin 'octol/vim-cpp-enhanced-highlight'

    "Brackets
    Plugin 'frazrepo/vim-rainbow'

    " Git
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'

    " Files
    Plugin 'junegunn/fzf'
    Plugin 'preservim/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    
    " Themes and colors
    Plugin 'mhartington/oceanic-next'

call vundle#end()
filetype plugin indent on


" OTHER
"------------------

" --WORKDIR--
set dir=~/.vim

" --BACKUP--
set backup
set backupdir=/tmp
set noswapfile

" --UNDO--
set undofile
set undodir=~/.vim/undo

" --SYNTAX--
syntax on
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1

" --AUTO COMPLETE--
let g:clang_library_path='/Users/itar/.vim/bundle/color_coded/build/clang+llvm-7.0.0-x86_64-apple-darwin/lib'

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
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colorscheme OceanicNext
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
let g:airline_theme='oceanicnext'
set laststatus=2

" --FAST SAVE--
nmap <F2> :w<CR>
vmap <F2> <esc>:w<CR>v
imap <F2> <esc>:w<CR>i

" --NERDTREE--
" Show the folder tree
nmap <C-N> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
