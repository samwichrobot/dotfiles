let g:ale_linters.go = ['gobuild', 'golint', 'gometalinter', 'govet']
let g:ale_fixers.go = ['goimports']

autocmd FileType go noremap <leader>t :GoTest<CR>
autocmd FileType go noremap <leader>y :GoAlternate<CR>
autocmd FileType go noremap <leader>b :GoBuild<CR>
