call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'

" Git
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-dispatch'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ervandew/supertab'

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

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kien/rainbow_parentheses.vim'

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set visualbell
set shell=/bin/zsh
set noswapfile

" Ggrep pops up quick fix window
autocmd QuickFixCmdPost *grep* cwindow

let g:NERDTreeWinPos = "right"

let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}

let g:ale_linters = {
\   'rust': ['rustc', 'cargo'],
\}

" Change mappings.
let mapleader = "\<Space>"

noremap <leader>w :NERDTreeToggle<CR>
noremap <leader>e :BufExplorer<CR>
noremap <leader>a :Copen<CR>
noremap <leader>d :ALEDetail<CR>

autocmd FileType rust noremap <leader>b :Dispatch cargo build<CR>
autocmd FileType rust noremap <leader>r :Dispatch cargo run<CR>
autocmd FileType rust noremap <leader>t :Dispatch cargo test<CR>
autocmd FileType rust noremap <leader>c :Dispatch cargo check<CR>

" Ensure ale temp files persist when sleeping
set dir=~/tmp

let g:ale_rust_rustc_options = ""
let g:indent_guides_enable_on_vim_startup = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set showtabline=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier = ':t'

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
