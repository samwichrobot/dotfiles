let mapleader = "\<Space>"
let g:syntastic_javascript_checkers = ['standard']
let g:jsx_ext_required = 0

let g:airline_left_sep=''
let g:airline_right_sep=''

colorscheme tender

set gfn=Hack\ 14
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
