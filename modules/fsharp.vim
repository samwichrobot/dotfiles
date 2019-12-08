nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType fsharp noremap <leader>b :Dispatch dotnet build<CR>
autocmd FileType fsharp noremap <leader>r :Dispatch dotnet run<CR>
autocmd FileType fsharp noremap <leader>t :Dispatch dotnet test<CR>
