call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" Git
Plug 'tpope/vim-fugitive'

" Misc
Plug 'Shougo/denite.nvim'
Plug 'alvan/vim-closetag'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'jlanzarotta/bufexplorer'
Plug 'nathanaelkane/vim-indent-guides'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Organization
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'irrationalistic/vim-tasks'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins'}

" Go
Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Ruby
Plug 'vim-ruby/vim-ruby'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'mattn/webapi-vim'
Plug 'racer-rust/vim-racer'

" C
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'justinmk/vim-syntax-extra'

call plug#end()

set nocompatible
set backspace=indent,eol,start

let mapleader = "\<Space>"
set completeopt=menu,preview,longest

set background=dark
colorscheme gruvbox

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

set noswapfile
set guioptions=a
set number
set ma
set autoread
set tabstop=2
set softtabstop=2
set shiftwidth=2
set linespace=0
set expandtab
set visualbell
set wildmenu
set wildmode=list:longest,full
set splitright
set splitbelow
set shell=zsh
set background=dark

" - Stop the bell ringing all the time when you do something dumb
" - or unnecessary.
set visualbell t_vb=
au GuiEnter * set visualbell t_vb=

" airline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'gruvbox'
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' ❤  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
set laststatus=2 " for airline

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" SuperTab uses omni if enabled
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

let g:rainbow_active = 1
let g:NERDTreeWinPos = "right"

map <leader>t :NERDTreeToggle<CR>
map <leader>p :Denite file/rec<CR>

let g:TasksArchiveSeparator = '______'
let g:notes_directories = ['~/Documents/Notes']

let g:neomake_open_list = 2
autocmd FileType go call neomake#configure#automake('w')

let g:deoplete#enable_at_startup = 1

autocmd FileType typescript map <buffer> <leader>e :Neomake eslint<CR>
autocmd FileType typescript map <buffer> <leader>d :TSDef<CR>

autocmd FileType typescript.tsx map <buffer> <leader>e :Neomake eslint<CR>
autocmd FileType typescript.tsx map <buffer> <leader>d :TSDef<CR>
map <buffer> <leader>u :sign unplace<CR>

" Change mappings.
call denite#custom#map(
    \ 'insert',
    \ '<C-p>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-n>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)

call denite#custom#var('file/rec', 'command',
   \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'c': ['clangd'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'go': ['gopls'],
    \ 'cpp': ['clangd'],
    \ }

autocmd Filetype rust nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype rust nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype rust nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype rust nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


autocmd Filetype c nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype c nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype c nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype c nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd Filetype cpp nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype cpp nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype cpp nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype cpp nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd Filetype ruby nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype ruby nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype ruby nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype ruby nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd Filetype go nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype go nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype go nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype go nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

autocmd Filetype c map <leader>y :call CurtineIncSw()<CR>

let g:indent_guides_enable_on_vim_startup = 1
