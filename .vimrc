call plug#begin('~/.vim/plugs')

" Themes
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'

" Git
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vimlab/split-term.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Comments
Plug 'tpope/vim-commentary'

" Formatting
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'godlygeek/tabular'
Plug 'w0rp/ale'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-sensible'

" C
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" JS
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/vimshell'
Plug 'sebdah/vim-delve'


call plug#end()

colorscheme gruvbox
let g:airline_theme='gruvbox'

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

set nocompatible
set completeopt=menu,longest
set number
set noswapfile
set autoread
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set visualbell
set shell=zsh

" Ggrep pops up quick fix window
autocmd QuickFixCmdPost *grep* cwindow

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\.(git|hg|svn|vscode|dSYM)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ }

let g:ctrlp_map = '<leader>p'

let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.o$', '\.dSYM$']

let g:rainbow_active = 1

let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

" Change mappings.
let mapleader = "\<Space>"

map <leader>w :sign unplace *<CR>
noremap <leader>t :NERDTreeToggle<CR>

" Tab Completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Disable powerline fonts
let g:airline_powerline_fonts = 0

" Vim GO
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

let g:go_null_module_warning = 0
let g:go_echo_command_info = 1

let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 0
let g:go_highlight_function_calls = 0
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
