" My vim dotfile
execute pathogen#infect()
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
filetype plugin indent on
set number
set nocompatible
syntax on
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set autoindent
set background=dark
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set t_Co=256
colorscheme zenburn
set tabstop=4
set expandtab
set scrolloff=3
set ai
set showcmd
set ruler
set hlsearch
set ignorecase
set smartcase
set hidden
set wildmenu
set title
