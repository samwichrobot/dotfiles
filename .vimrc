call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'

" Git
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'

" Comments
Plug 'tpope/vim-commentary'

" Formatting
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

set bg=dark
colorscheme gruvbox

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

set nocompatible
set completeopt=menu,longest
set number
set autoread
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set visualbell
set shell=/bin/zsh

set nobackup
set noswapfile
set noundofile

" Ggrep pops up quick fix window
autocmd QuickFixCmdPost *grep* cwindow

let g:NERDTreeWinPos = "right"

let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}

" Change mappings.
let mapleader = "\<Space>"

noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>e :BufExplorer<CR>

" Vim GO
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

" Ensure ale temp files persist when sleeping
set dir=~/tmp
