let mapleader = "\<Space>"
let g:syntastic_javascript_checkers = ['standard']
let g:jsx_ext_required = 0

let g:airline_left_sep=''
let g:airline_right_sep=''

colorscheme gruvbox

" For gvim in linux
set gfn=Hack\ 14

" For macvim
set guifont=Hack:h16

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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Nerdtree shortcut
map <leader>l :NERDTreeToggle<CR>

" Folding setup
set foldmethod=indent
set foldlevel=99
noremap <leader>f za

" Remove whitespace on save
let g:spacejam_filetypes = 'ruby,javascript,vim,perl,sass,scss,css,coffee,haml,python,go'

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" SuperTab uses omni if enabled
let g:SuperTabDefaultCompletionType = "context"

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" vim-go setup
let g:go_fmt_command = "goimports"

" tasks setup

let g:TasksMarkerBase = '☐'
let g:TasksMarkerDone = '✔'
let g:TasksMarkerCancelled = '✘'
let g:TasksDateFormat = '%Y-%m-%d %H:%M'
let g:TasksAttributeMarker = '@'
let g:TasksArchiveSeparator = '-------------------------------'
