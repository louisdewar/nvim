set showcmd
set number
set relativenumber
set showmatch
set expandtab
set shiftwidth=4
set hidden
" Show hidden characters
set list

set mouse=a

" <Alt-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <A-l> :nohl<CR>

" Quick-save
nmap <leader>w :w<CR>

" Quick buffer switching
nmap <leader><leader> :b#<CR>

" <Ctrl-j> exits mode
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" Netrw
let g:netrw_liststyle = 3

" nnoremap <silent> <C-t> :Vexplore<Cr>
nnoremap <silent> <C-n> :Explore<Cr>

" Short cuts to switch between panes
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" <Ctrl-w> exits insert mode and saves
inoremap <C-w> <Esc> :w<CR>
nnoremap <C-w> <Esc> :w<CR>
vnoremap <C-w> <Esc> :w<CR>

" Live search and replace
set inccommand=nosplit
