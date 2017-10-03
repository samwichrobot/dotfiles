call plug#begin('~/.vim/plugs')
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus'
Plug 'jacoborus/tender'
Plug 'morhetz/gruvbox'
Plug 'othree/yajs.vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'irrationalistic/vim-tasks'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'mtth/scratch.vim'
Plug 'moll/vim-node'
Plug 'hashrocket/vim-hashrocket'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jbranchaud/vim-bdubs'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'heartsentwined/vim-emblem'
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-blockle'
Plug 'jgdavey/vim-turbux'
Plug 'jgdavey/vim-weefactor'
Plug 'leshill/vim-json'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'rondale-sc/vim-spacejam'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/bufkill.vim'
Plug 'wgibbs/vim-irblack'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'exu/pgsql.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
call plug#end()

let mapleader = "\<Space>"
let g:syntastic_javascript_checkers = ['standard']
let g:jsx_ext_required = 0
set completeopt=menu,preview,longest

let g:airline_left_sep=''
let g:airline_right_sep=''

colorscheme gruvbox

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

set guioptions=a
set number
set ma

" For gvim in linux
set gfn=Hack\ 18

" For macvim
set guifont=Hack:h18

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

" Setup ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Nerdtree shortcut
map <leader>l :NERDTreeToggle<CR>

" Folding setup
set foldmethod=indent
set foldlevel=99
noremap <leader>f za

" Remove whitespace on save
let g:spacejam_filetypes = 'ruby,javascript,vim,perl,sass,scss,css,coffee,haml,python'

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" tasks setup

let g:TasksMarkerBase = '☐'
let g:TasksMarkerDone = '✔'
let g:TasksMarkerCancelled = '✘'
let g:TasksDateFormat = '%Y-%m-%d %H:%M'
let g:TasksAttributeMarker = '@'
let g:TasksArchiveSeparator = '-------------------------------'

" vim-node setup
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif


" link vim notes to Dropbox
let g:notes_directories = ['~/Dropbox/Notes']
