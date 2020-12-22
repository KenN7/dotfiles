" My vim dotfile
"""""""""""""""""""""""""""
" Plugins 
"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'slim-template/vim-slim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'sbdchd/neoformat'
Plug 'lervag/vimtex'
Plug 'reedes/vim-wordy'
Plug 'kshenoy/vim-signature'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
" my shit \o/
Plug 'kenn7/vim-arsync'
" Plug '/home/ken/depots/vim-arsync'

call plug#end()

""""""""""""""""""""""""""
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

" Hard wrap at 80 char and put vertical line
set colorcolumn=100
set textwidth=100
" no auto wrapping
set fo-=t

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
set clipboard=unnamedplus

" Keep Undo history on buffer change
set hidden

" optimization
" set lazyredraw

" Reload files after change on Disk
" set autoread
" au CursorHold * checktime

" Turn on syntax hightlighting.
set syntax=on
set nowrap
set tabstop=4
set shiftwidth=4
set nocindent

" Deactivate automatic newline comments
set formatoptions-=cro

" Theme
set background=dark
set termguicolors
let g:quantum_black=1
colorscheme quantum
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
" for tmux colors in vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"Option for Coc.nvim
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c

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

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" YCM options
" let g:ycm_python_binary_path = 'python3'
" " leave preview mode (with docs) after insert mode is left
" let g:ycm_autoclose_preview_window_after_insertion = 1

" " LaTex completion
" if !exists('g:ycm_semantic_triggers')
"   let g:ycm_semantic_triggers = {}
" endif
" au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" My custom bibtex completion
let g:my_bibtex_file = "/home/ken/depots/demiurge-bib/author.bib /home/ken/depots/demiurge-bib/journal.bib /home/ken/depots/demiurge-bib/bibliography.bib"
function! SinkBib(lines)
    let l:key = split(a:lines)
    execute ':normal! a' . l:key[0]
endfunction
" trigger bibtex complete on '@@'
inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
            \ 'source': 'bib-ls.py -f ' . g:my_bibtex_file,
            \ 'sink': function('SinkBib'),
            \ 'down': '40%'})<CR>

" vimtex flavor setting
let g:tex_flavor = 'latex'

" Start tagbar
" autocmd VimEnter * TagbarToggle
" change :copen to always open preview under main buffer
autocmd FileType qf wincmd J
" command! copen call botright copen

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
noremap <silent> <C-f> :NERDTreeToggle<CR>

" remap ESC to exit terminal mode (breaks fzf popup)
" tnoremap <Esc> <C-\><C-n>

" Select all
" map <C-a> <esc>ggVG<CR>

" Insert mode completion for fzf
" search path of file of folder in current project (subdirs)
imap <c-x><c-f> <plug>(fzf-complete-path)

" Border style of fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

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

" allows to search file with fzf and insert content of file in current buffer
function! GoSink(file)
    let l:path_to_file = fnamemodify(a:file, ':p')
    echom l:path_to_file
    execute ':r ' . l:path_to_file
endfunction

command! -bang -nargs=* InsertFile 
    \ call fzf#run({
    \ 'source': 'find ' . <q-args> . " -path '*/\.*' -prune -o -type f -print \| sed '1d'",
    \ 'sink':    function('GoSink')})


