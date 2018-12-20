call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " navigate up a directory with '-' in netrw, among other things
  Plug 'tpope/vim-vinegar'

  Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'

  Plug 'neomake/neomake'

  Plug 'opodartho/vim-linenum'

  Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  " Plug 'altercation/vim-colors-solarized'
  Plug 'challenger-deep-theme/vim'

  Plug 'slim-template/vim-slim'
  Plug 'airblade/vim-gitgutter'

  Plug 'mileszs/ack.vim'

  Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.

  Plug 'takac/vim-hardtime'

  Plug 'schickling/vim-bufonly'
  Plug 'elixir-lang/vim-elixir'
  Plug 'mxw/vim-jsx'
  Plug 'scrooloose/nerdtree'

  Plug 'mattn/emmet-vim'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Plugins settings

" Slim plugin
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.slime setlocal filetype=slim

" FZF fuzzy finder
nnoremap <silent> <C-P> :FZF<cr>
nnoremap <silent> <leader>a :Ag<cr>
augroup localfzf
  autocmd!
  autocmd FileType fzf :tnoremap <buffer> <C-J> <C-J>
  autocmd FileType fzf :tnoremap <buffer> <C-K> <C-K>
augroup END

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <C-B> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'challenger_deep'
let g:airline_powerline_fonts = 1

" Solarized
" syntax on
" set background=dark
" colorscheme solarized

let g:challenger_deep_terminal_italics = 1
let g:challenger_deep_termcolors = 16
colorscheme challenger_deep

" Neomake
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_slim_enabled_makers = ['slimlint']
let g:neomake_javascript_eslint_maker = {
  \ 'args': ['--no-colors', '--reporter', 'inline', '--preset=airbnb'],
  \ 'errorformat': '%f: line %l\, col %c\, %m',
\}
let g:neomake_javascript_enabled_markers = ['eslint']
" BufOnly
nmap <silent> <leader>x :BufOnly<CR>

" Tagbar toggle
nmap <silent> <leader>t :TagbarToggle<CR>

" Hardtime
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 0

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" NerdTree
nnoremap <silent><Leader>k :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
