call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Editing
Plug 'terryma/vim-multiple-cursors'

" Command Line
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'

" Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'scrooloose/nerdtree'

" lightline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Misc
Plug 'ervandew/supertab'
Plug 'davidoc/taskpaper.vim'

" Comments
Plug 'tpope/vim-commentary'

" Formatting
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'

" Rust
Plug 'rust-lang/rust.vim'

" Local Plugs
if filereadable(expand('~/.plugs.local'))
  source ~/.plugs.local
endif

call plug#end()

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

syntax enable
colorscheme gruvbox
set bg=dark
set termguicolors
set showtabline=0
set nocompatible
set completeopt=menu,longest
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set belloff=all
set shell=/bin/zsh
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Ensure ale temp files persist when sleeping
set dir=~/tmp


" Ggrep pops up quick fix window
autocmd QuickFixCmdPost *grep* cwindow

let g:ale_rust_rustc_options = ""
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_use_clippy = 1
let g:ale_set_quickfix = 1
let g:ale_rust_rls_config = {
      \   'rust': {
      \     'clippy_preference': 'on'
      \   }
      \ }
let g:ale_linters = {
\   'rust': ['rls'],
\   'go': ['gopls', 'golint'],
\}
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'go': ['goimports'],
\}

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

let g:NERDTreeWinPos = "right"
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

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Change mappings.
let mapleader = "\<Space>"

noremap <leader>w :NERDTreeToggle<CR>
noremap <leader>e :BufExplorer<CR>
noremap <leader>a :copen<CR>
noremap <leader>d :ALEDetail<CR>
noremap <leader>j :BookmarkToggle<CR>
noremap <leader>n :BookmarkAnnotate<CR>
noremap <leader>l :BookmarkShowAll<CR>

autocmd FileType rust nmap gd <Plug>(ale_go_to_definition)
autocmd FileType rust nmap <F2> <Plug>(ale_rename)
autocmd FileType rust nmap K <Plug>(ale_hover)
autocmd FileType rust noremap <leader>b :Dispatch cargo build<CR>
autocmd FileType rust noremap <leader>r :Dispatch cargo run<CR>
autocmd FileType rust noremap <leader>t :Dispatch cargo test<CR>
autocmd FileType rust noremap <leader>c :Dispatch cargo check<CR>
autocmd FileType rust noremap <leader>f :RustTest<CR>

" Local settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

let g:lightline#ale#indicator_checking = "???"
let g:lightline#ale#indicator_warnings = "WARN "
let g:lightline#ale#indicator_errors = "ERR "
let g:lightline#ale#indicator_ok = "OK"

if has("gui_running")
  if has("gui_macvim")
    set guifont=Fira\ Code:h15
  else
    set guifont=Fira\ Code\ 15
    set clipboard=unnamedplus
  endif
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
endif
