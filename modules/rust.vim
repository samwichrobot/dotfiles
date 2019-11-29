let g:ale_rust_rls_config = {
      \   'rust': {
      \     'clippy_preference': 'on'
      \   }
      \ }

let g:ale_rust_rustc_options = ""
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_use_clippy = 1

let g:ale_fixers.rust = ['rustfmt']
let g:ale_linters.rust = ['rls']

autocmd FileType rust nmap gd <Plug>(ale_go_to_definition)
autocmd FileType rust nmap <F2> <Plug>(ale_rename)
autocmd FileType rust nmap K <Plug>(ale_hover)
autocmd FileType rust noremap <leader>b :Dispatch cargo build<CR>
autocmd FileType rust noremap <leader>r :Dispatch cargo run<CR>
autocmd FileType rust noremap <leader>t :Dispatch cargo test<CR>
autocmd FileType rust noremap <leader>c :Dispatch cargo check<CR>
autocmd FileType rust noremap <leader>f :RustTest<CR>
