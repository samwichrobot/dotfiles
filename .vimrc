call plug#begin('~/.vim/plugs')

" Themes
Plug 'rakr/vim-one'

" Git
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vimlab/split-term.vim'
Plug 'vim-airline/vim-airline'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

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

" JS
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'

" Calendar
Plug 'itchyny/calendar.vim'

call plug#end()

colorscheme one
let g:airline_theme='one'

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

let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
		\ 'go': ['gopls'],
    \ }

" Change mappings.
let mapleader = "\<Space>"

map <leader>w :sign unplace *<CR>
noremap <leader>t :NERDTreeToggle<CR>

autocmd Filetype c map <leader>y :call CurtineIncSw()<CR>
autocmd Filetype c nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype c nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype c nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype c nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd Filetype cpp map <leader>y :call CurtineIncSw()<CR>
autocmd Filetype cpp nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype cpp nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype cpp nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype cpp nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd Filetype go nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype go nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype go nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype go nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Tab Completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Enable Google Calendar integration.
let g:calendar_google_calendar = 1

" Disable powerline fonts
let g:airline_powerline_fonts = 0
