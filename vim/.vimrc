" My vim dotfile
"""""""""""""""""""""""""""
" Plugins 
"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'severin-lemaignan/vim-minimap'
Plug 'slim-template/vim-slim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --all' }
Plug 'sbdchd/neoformat'

call plug#end()

"""""""""""""""""""""""""""
" Vim conf
""""""""""""""""""""""""""

" disable bells
autocmd! GUIEnter * set vb t_vb=

" Do not make vim compatible with vi.
set nocompatible

" Do not create .swp files
" set noswapfile

" Number the lines.
set number

" Show auto complete menus.
set wildmenu

" Make wildmenu behave like bash completion. Finding commands are so easy now.
set wildmode=list:longest

" Enable mouse pointing
set mouse=a

" ALWAYS spaces
set expandtab

" Fix backspace behavior 
set backspace=indent,eol,start

" Use system clipboard 
set clipboard+=unnamed

" Keep Undo history on buffer change
set hidden

" optimization
set lazyredraw

" Reload files after change on Disk
" set autoread
" au CursorHold * checktime

" Turn on syntax hightlighting.
set syntax=on
set nowrap
set tabstop=4
set shiftwidth=4
set nocindent

" Theme
set background=dark
set termguicolors
let g:quantum_black=1
colorscheme quantum
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1

" Indent Guides
let g:indentLine_enabled=1
let g:indentLine_color_term=235
let g:indentLine_char='┆'

" Start minimap
let g:minimap_highlight='Visual'
autocmd VimEnter * Minimap

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Chain vimgrep and copen
augroup qf
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    cwindow
    autocmd VimEnter        *     cwindow
augroup END

" Change cursor appearance depending on the current mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""""""""""""""""""""""""""
" Custom bindings
""""""""""""""""""""""""""

" Browse airline tabs
nnoremap <C-p> :bnext<CR>
nnoremap <C-o> :bprevious<CR>

" Map Control S for save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S>  <C-O>:update<CR>

" Comment block
vnoremap <silent> <C-k> :Commentary<cr>
nnoremap <silent> <C-k> :Commentary<cr>

" Close current buffer
noremap <C-q> :bp<cr>:bd #<cr>

" Toggle Nerdtree
noremap <silent> <C-f> ::NERDTreeToggle<CR>

" remap ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Select all
map <C-a> <esc>ggVG<CR>

" Insert mode completion for fzf
" search path of file of folder in current project (subdirs)
imap <c-x><c-f> <plug>(fzf-complete-path)

" search in the whole home folder (can be long)
inoremap <c-x><c-h> <c-r>=fzf#vim#complete#path("find ~/ -path '*/\.*' -prune -o -print \| sed '1d'")<cr>

" fuzzy ripgrep into file of any precise folder :PRg <folder> <pattern>
command! -bang -nargs=* PRg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, 1,
  \ <bang>0)

" fuzzy ripgrep into depot folder of my home
command! -bang -nargs=* DepRg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " . <q-args> . " ~/depots", 1,
  \ <bang>0)
