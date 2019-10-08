call plug#begin('~/.vim/plugs')

" Themes
Plug 'flazz/vim-colorschemes'

" Git
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'

" Comments
Plug 'tpope/vim-commentary'

" Formatting
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'
Plug 'sebdah/vim-delve'

" Rust
Plug 'rust-lang/rust.vim'
call plug#end()

set bg=light
colorscheme PaperColor

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
let NERDTreeIgnore = ['\.o$', '\.dSYM$']

let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}

" Change mappings.
let mapleader = "\<Space>"

map <leader>w :sign unplace *<CR>
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>e :BufExplorer<CR>

" Tab Completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

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

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run stable rustfmt'
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rustfmt_options = ''
