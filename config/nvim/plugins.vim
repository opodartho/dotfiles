call plug#begin('~/.config/nvim/plugged')
  " navigate up a directory with '-' in netrw, among other things
  Plug 'tpope/vim-vinegar'

  Plug 'tpope/vim-rails'




  Plug 'slim-template/vim-slim'



  Plug 'takac/vim-hardtime'

  Plug 'schickling/vim-bufonly'
  Plug 'elixir-lang/vim-elixir'
  Plug 'mxw/vim-jsx'

  Plug 'mattn/emmet-vim'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Plugins settings

" Slim plugin
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.slime setlocal filetype=slim


" Hardtime
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 0

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" vim-go
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = '10s'

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>c :cclose<cr>

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
" BufOnly
nmap <silent> <leader>x :BufOnly<CR>
