let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-explorer', 'coc-solargraph', 'coc-elixir', 'coc-kotlin']

nnoremap <silent><Leader>k :CocCommand explorer<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
