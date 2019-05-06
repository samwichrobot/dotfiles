call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" Git
Plug 'tpope/vim-fugitive'

" Misc
Plug 'alvan/vim-closetag'
Plug 'epeli/slimux'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'neomake/neomake'
Plug 'Shougo/denite.nvim'

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
Plug 'fatih/vim-go'

" Clang
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/deoplete-clangx'

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

" Nerdtree config
map <leader>t :NERDTreeToggle<CR>

map <leader>p :Denite file/rec<CR>

let g:TasksArchiveSeparator = '______'
let g:notes_directories = ['~/Documents/Notes']

let g:neomake_open_list = 2

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

let g:deoplete#enable_at_startup = 1

autocmd FileType typescript.tsx map <buffer> <leader>d :TSDef<CR>
autocmd FileType typescript map <buffer> <leader>d :TSDef<CR>
autocmd FileType typescript map <buffer> <leader>e :Neomake eslint<CR>
autocmd FileType typescript.tsx map <buffer> <leader>e :Neomake eslint<CR>

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
