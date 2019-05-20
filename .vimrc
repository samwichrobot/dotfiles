call plug#begin('~/.vim/plugs')

" Themes
Plug 'adlawson/vim-sorcerer'
Plug 'romainl/Apprentice'

" Git
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'Shougo/denite.nvim'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'vimlab/split-term.vim'

" Comments
Plug 'tpope/vim-commentary'
Plug 'jbgutierrez/vim-better-comments'
Plug 'vim-scripts/TaskList.vim'

" Misc
Plug 'neomake/neomake'
Plug 'alvan/vim-closetag'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-sensible'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" C
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'justinmk/vim-syntax-extra'

call plug#end()

colorscheme apprentice

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

set nocompatible
" set backspace=indent,eol,start
set completeopt=menu,preview,longest
set noswapfile
set number
set ma
set autoread
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set visualbell
set shell=zsh

let g:NERDTreeWinPos = "right"
let g:neomake_open_list = 2
let g:rainbow_active = 1
let g:deoplete#enable_at_startup = 1

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
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'go': ['gopls'],
    \ 'typescript': ['tsserver'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }

let mapleader = "\<Space>"
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>p :Denite file/rec<CR>

map <leader>l <Plug>TaskList

autocmd FileType typescript map <buffer> <leader>e :Neomake eslint<CR>
autocmd FileType typescript.tsx map <buffer> <leader>e :Neomake eslint<CR>

autocmd FileType typescript map <buffer> gd :TSDef<CR>
autocmd FileType typescript.tsx map <buffer> gd :TSDef<CR>

autocmd Filetype c map <leader>y :call CurtineIncSw()<CR>
autocmd Filetype c nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype c nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype c nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype c nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType go call neomake#configure#automake('w')
autocmd Filetype go nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd Filetype go nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd Filetype go nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd Filetype go nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

