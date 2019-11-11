call plug#begin('~/.vim/plugs')

" Themes
Plug 'Rigellute/rigel'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Navigation
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

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


" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

call plug#end()

set bg=dark
colorscheme rigel
set termguicolors
syntax enable

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

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}

let g:ale_linters = {
\   'rust': ['rls'],
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
autocmd FileType rust noremap <leader>j :BookmarkToggle<CR>


" Ensure ale temp files persist when sleeping
set dir=~/tmp

let g:ale_rust_rustc_options = ""
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_use_clippy = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:lightline = {
      \ 'colorscheme': 'rigel',
      \ }

let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier = ':t'

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" Local settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "m",
    \ "Staged"    : "a",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : ">",
    \ "Deleted"   : "d",
    \ "Dirty"     : "c",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : 'i',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeShowIgnoredStatus = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ale_rust_rls_config = {
      \   'rust': {
      \     'clippy_preference': 'on'
      \   }
      \ }

autocmd FileType rust nmap gd <Plug>(ale_go_to_definition)
autocmd FileType rust nmap <F2> <Plug>(ale_rename)
