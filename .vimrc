call plug#begin('~/.vim/plugs')
Plug 'flazz/vim-colorschemes'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'irrationalistic/vim-tasks'
Plug 'mtth/scratch.vim'
Plug 'godlygeek/tabular'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-vinegar'
Plug 'moll/vim-node'
Plug 'leshill/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
call plug#end()

let mapleader = "\<Space>"
let g:jsx_ext_required = 0
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
set noundofile
set noswapfile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set linespace=0
set expandtab
set undodir=/tmp
set visualbell
set wildmenu
set wildmode=list:longest,full
set splitright
set splitbelow
set hidden
set shell=zsh
set background=dark

" - Stop the bell ringing all the time when you do something dumb
" - or unnecessary.
set visualbell t_vb=
au GuiEnter * set visualbell t_vb=

" airline
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = '  ❤  '
let g:airline_right_sep = '  ❤  '
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

" Nerdtree shortcut
map <leader>l :NERDTreeToggle<CR>
map <leader>e :CtrlPBuffer<CR>
map <leader>a :Note<CR>

" Folding setup
set foldmethod=indent
set foldlevel=99
noremap <leader>f za

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tasks setup
let g:TasksMarkerBase = '☐'
let g:TasksMarkerDone = '✔'
let g:TasksMarkerCancelled = '✘'
let g:TasksDateFormat = '%Y-%m-%d %H:%M'
let g:TasksAttributeMarker = '@'
let g:TasksArchiveSeparator = '-------------------------------'
let g:notes_directories = ['~/.notes']
let NERDTreeShowHidden=1

" ALE
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

nmap <leader>d <Plug>(ale_detail)
nmap ]r <Plug>(ale_next_wrap)
nmap [r <Plug>(ale_previous_wrap)
nmap gd <Plug>(ale_go_to_definition)
nmap gh <Plug>(ale_hover)

hi SpellBad ctermbg=NONE ctermfg=NONE cterm=underline
hi ALEWarning ctermbg=NONE ctermfg=NONE cterm=underline

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
