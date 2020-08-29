call plug#begin(stdpath('data') . '/plugged')

" File management
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'

" Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language specific support
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'

" Editor improvements
Plug 'tpope/vim-sleuth'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-surround'

" GUI
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'

" Other
Plug 'tpope/vim-fugitive'

call plug#end()

let mapleader = "\<Space>"

" Source other config files in this directory
for f in split(glob('`fdfind -e vim -E "init.vim" . ~/.config/nvim/`'), '\n')
    execute 'source' f
endfor
