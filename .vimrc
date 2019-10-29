call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

" Git
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'scrooloose/nerdtree'

" Misc
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'davidoc/taskpaper.vim'

" Comments
Plug 'tpope/vim-commentary'

" Formatting
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'yggdroot/indentline'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust
Plug 'rust-lang/rust.vim'

" Racket
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'wlangstroth/vim-racket'
Plug 'bhurlow/vim-parinfer'

call plug#end()

set bg=dark
colorscheme one

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

set showtabline=0
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
autocmd FileType rust noremap <leader>f :RustTest<CR>


" Ensure ale temp files persist when sleeping
set dir=~/tmp

let g:ale_rust_rustc_options = ""
let g:ale_rust_cargo_check_tests = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier = ':t'

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
