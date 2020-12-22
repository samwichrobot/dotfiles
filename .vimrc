call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'

" vim: ft=vim
" Vim Plugins via Vim Plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if &compatible
  set nocompatible
end

" Make sure you use single quotes
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'hashrocket/vim-hashrocket'
Plug 'jbranchaud/vim-bdubs'
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-blockle'
Plug 'jgdavey/vim-railscasts'
Plug 'jgdavey/vim-turbux'
Plug 'jgdavey/vim-weefactor'
Plug 'kana/vim-textobj-user'
Plug 'leshill/vim-json'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'pangloss/vim-javascript'
Plug 'rondale-sc/vim-spacejam'
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

" staticly check code and highlight errors (async syntastic replacement)
Plug 'w0rp/ale'

call plug#end()

set guifont=Monaco:h24

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

syntax enable
set background=dark
colorscheme gruvbox

set number
set bg=dark
set completeopt=menu,longest
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set belloff=all
set shell=/bin/zsh
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Ensure ale temp files persist when sleeping
set dir=~/tmp
set directory=~/.vim/tmp
set cmdheight=1

" Ggrep pops up quick fix window
autocmd QuickFixCmdPost *grep* cwindow

" Ale
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Change mappings.
let mapleader = "\<Space>"

noremap <leader>e :BufExplorer<CR>
noremap <leader>a :copen<CR>
noremap <leader>o :lopen<CR>
noremap <leader>d :ALEDetail<CR>
