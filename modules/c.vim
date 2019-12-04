if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

let g:ale_fixers.c = ['clang-format']
let g:ale_linters.c = ['clang', 'clangtidy', 'clangd']

let g:ale_fixers.cpp = ['clang-format']
let g:ale_linters.cpp = ['clang', 'clangtidy', 'clangd']

autocmd FileType c map <leader>y :call CurtineIncSw()<CR>
autocmd FileType cpp map <leader>y :call CurtineIncSw()<CR>

autocmd FileType c nmap gd <plug>(lsp-definition)
autocmd FileType c nmap K <plug>(lsp-hover)
autocmd FileType c nmap <F2> <plug>(lsp-rename)
