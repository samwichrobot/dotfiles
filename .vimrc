call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'

" Git
Plug 'tpope/vim-fugitive'

" Command Line
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'

" Navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

" Misc
Plug 'tpope/vim-sensible'
Plug 'frazrepo/vim-rainbow'

" Comments
Plug 'tpope/vim-commentary'

" Formatting
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" Search
call plug#end()

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

syntax enable
colorscheme dracula

set guifont=Fira\ Code:h22

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
set dir=~/tmp
set cmdheight=1

" rainbow brackets
let g:rainbow_active = 1

" Ggrep pops up quick fix window
autocmd QuickFixCmdPost *grep* cwindow

let g:NERDTreeWinPos = "right"
let g:NERDTreeShowIgnoredStatus = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

" Change mappings.
let mapleader = "\<Space>"

noremap <leader>w :NERDTreeToggle<CR>
noremap <leader>e :BufExplorer<CR>
noremap <leader>a :copen<CR>
noremap <leader>o :CocDiagnostics<CR>
noremap <leader>j :BookmarkToggle<CR>
noremap <leader>n :BookmarkAnnotate<CR>
noremap <leader>l :BookmarkShowAll<CR>
noremap <leader>f :Ag<CR>

"" Lightline
""
"autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()


nmap <silent> gd <Plug>(coc-definition)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
