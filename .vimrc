call plug#begin('~/.vim/plugs')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-dispatch'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'irrationalistic/vim-tasks'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'


" Clojure
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-dispatch'
Plug 'luochen1990/rainbow'
Plug 'bhurlow/vim-parinfer'
Plug 'tpope/vim-classpath'
Plug 'clojure-vim/async-clj-omni'
Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins'}

call plug#end()

set guifont=Fira\ Code:h17

set nocompatible
set backspace=indent,eol,start

let mapleader = "\<Space>"
set completeopt=menu,preview,longest

set background=dark
colorscheme dracula

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

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
let g:airline_theme = 'dracula'
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' ❤  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
set laststatus=2 " for airline

" Setup ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" SuperTab uses omni if enabled
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

let g:rainbow_active = 1

autocmd FileType typescript.tsx map <buffer> <leader>d :TSDef<CR>
autocmd FileType typescript map <buffer> <leader>d :TSDef<CR>

autocmd FileType clojure map <buffer> <leader>e :%Eval<CR>
autocmd FileType clojure nmap <buffer> <leader>d [<C-D>

" Nerdtree config
map <leader>t :NERDTreeToggle<CR>

let g:deoplete#enable_at_startup = 1

let g:TasksArchiveSeparator = '______'
let g:notes_directories = ['~/Documents/Notes']
