set showcmd
set number
set relativenumber
set showmatch
set expandtab
set hidden
" Show hidden characters
set list

set mouse=a

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <A-l> :nohl<CR>

" Quick-save
nmap <leader>w :w<CR>

" Quick buffer switching
nmap <leader><leader> :b#<CR>

" <Ctrl-j> exits insert mode
inoremap <C-j> <Esc>

" <Ctrl-w> exits insert mode and saves
inoremap <C-w> <Esc> :w<CR>

" Netrw
let g:netrw_liststyle = 3

" nnoremap <silent> <C-t> :Vexplore<Cr>
nnoremap <silent> <C-n> :Explore<Cr>

" Short cuts to switch between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
