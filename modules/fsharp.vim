nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" Or map each action separately
autocmd FileType fsharp noremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd FileType fsharp noremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd FileType fsharp noremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType fsharp noremap <leader>b :Dispatch dotnet build<CR>
autocmd FileType fsharp noremap <leader>r :Dispatch dotnet run<CR>
autocmd FileType fsharp noremap <leader>t :Dispatch dotnet test<CR>
