call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'thedenisnikulin/vim-cyberpunk'
Plug 'croaker/mustang-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'junegunn/seoul256.vim'

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
Plug 'cweagans/vim-taskpaper'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" Comments
Plug 'tpope/vim-commentary'
Plug 'gyim/vim-boxdraw'

" Formatting
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

Plug 'liuchengxu/eleline.vim'
Plug 'liuchengxu/vista.vim'

Plug 'bhurlow/vim-parinfer'

call plug#end()

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-sh',
      \ 'coc-json',
      \ 'coc-word',
      \ 'coc-syntax',
      \ 'coc-html',
      \ 'coc-eslint',
      \ 'coc-emoji',
      \ 'coc-rust-analyzer',
      \ 'coc-css',
      \ 'coc-docker',
      \ 'coc-highlight',
      \ 'coc-pairs',
      \ 'coc-yaml',
      \ 'coc-clangd',
      \]

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

syntax enable
set termguicolors
colorscheme dracula

set cursorline
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

nmap <silent> gd <Plug>(coc-definition)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gs :sp<CR><Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" --------------------------------------------------------
" SETTINGS START

set completeopt=longest,menuone

" SETTINGS END
" --------------------------------------------------------

" --------------------------------------------------------
" COC-VIM TAB SETTINGS START

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" COC-VIM TAB SETTINGS END
" --------------------------------------------------------

set cursorline

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 0

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_executive_for = {
  \ 'rust': 'coc',
  \ 'typescript': 'coc',
  \ 'javascript': 'coc',
  \ 'c': 'coc'
  \ }

let g:vista_update_on_text_changed = 1
