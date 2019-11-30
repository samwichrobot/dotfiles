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
