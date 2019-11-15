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
Plug 'terryma/vim-multiple-cursors'

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
colorscheme rigel
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
\}
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}

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
