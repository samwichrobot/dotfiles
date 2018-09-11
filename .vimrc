set tabstop=2
set softtabstop=2
set shiftwidth=2
set linespace=0
set expandtab

call plug#begin('~/.vim/plugs')
Plug 'flazz/vim-colorschemes'
Plug 'posva/vim-vue'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'irrationalistic/vim-tasks'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'mtth/scratch.vim'
Plug 'hashrocket/vim-hashrocket'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jbranchaud/vim-bdubs'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-blockle'
Plug 'jgdavey/vim-turbux'
Plug 'jgdavey/vim-weefactor'
Plug 'mileszs/ack.vim'
Plug 'rondale-sc/vim-spacejam'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'kana/vim-textobj-user'
Plug 'exu/pgsql.vim'
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
Plug 'leshill/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter'
call plug#end()

let mapleader = "\<Space>"
let g:jsx_ext_required = 0
set completeopt=menu,preview,longest

set background=dark
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
set guifont=Fira\ Code:h18

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
map <leader>s :Scratch<CR>

map <leader>a :Note<CR>

" Go shortcuts
autocmd FileType go map <leader>r :GoRename<CR>
autocmd FileType go map <leader>g :GoBuild<CR>
autocmd FileType go map <leader>h :GoDoc<CR>
autocmd FileType go map <leader>t :GoTest<CR>
autocmd FileType go map <leader>i :GoImpl<CR>

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

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


" tasks setup

let g:TasksMarkerBase = '☐'
let g:TasksMarkerDone = '✔'
let g:TasksMarkerCancelled = '✘'
let g:TasksDateFormat = '%Y-%m-%d %H:%M'
let g:TasksAttributeMarker = '@'
let g:TasksArchiveSeparator = '-------------------------------'
let g:notes_directories = ['~/.notes']
let NERDTreeShowHidden=1

let g:ale_fix_on_save = 1

" Typescript setup
"
let g:ale_lint_on_text_changed='always'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
