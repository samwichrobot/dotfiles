call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" Git
Plug 'tpope/vim-fugitive'

" Misc
Plug 'alvan/vim-closetag'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'w0rp/ale'

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

" Nerdtree config
map <leader>t :NERDTreeToggle<CR>

let g:TasksArchiveSeparator = '______'
let g:notes_directories = ['~/Documents/Notes']
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

let g:deoplete#enable_at_startup = 1

autocmd FileType typescript.tsx map <buffer> <leader>d :TSDef<CR>
autocmd FileType typescript map <buffer> <leader>d :TSDef<CR>
