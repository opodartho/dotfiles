call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " navigate up a directory with '-' in netrw, among other things
  Plug 'tpope/vim-vinegar'

  Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'

  Plug 'neomake/neomake'

  Plug 'opodartho/vim-linenum'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'altercation/vim-colors-solarized'

  Plug 'slim-template/vim-slim'
  Plug 'airblade/vim-gitgutter'

  Plug 'mileszs/ack.vim'

  Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.

  Plug 'takac/vim-hardtime'

  Plug 'schickling/vim-bufonly'
  Plug 'elixir-lang/vim-elixir'
call plug#end()


" Plugins settings

" FZF fuzzy finder
" let g:fzf_layout = { 'window': 'enew' }
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
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" Solarized
syntax on
set background=dark
colorscheme solarized

" Neomake
let g:neomake_ruby_enabled_makerd = ['mri', 'rubocop']
let g:neomake_slim_enabled_makers = ['slimlint']
let g:neomake_javascript_jscs_maker = {
  \ 'args': ['--no-colors', '--reporter', 'inline', '--preset=airbnb'],
  \ 'errorformat': '%f: line %l\, col %c\, %m',
\}

" BufOnly
nmap <silent> <leader>b :BufOnly<CR>

" Tagbar toggle
nmap <silent> <leader>t :TagbarToggle<CR>

" Hardtime
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 0

" netrw file explorer

fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose()
  else
    call VexOpen(a:dir)
  endif
endf

fun! VexOpen(dir)
  let g:netrw_browse_split=4    " open files in previous window
  let vex_width = 30

  execute "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H

  call VexSize(vex_width)
endf

fun! VexClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  close
  unlet t:vex_buf_nr

  execute (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endf

fun! VexSize(vex_width)
  execute "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endf

fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

augroup NetrwGroup
  autocmd! BufEnter * call NormalizeWidths()
augroup END

let g:netrw_liststyle=3         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically

noremap <silent><Leader>k :call VexToggle(getcwd())<CR>
noremap <silent><Leader>y :call VexToggle("")<CR>
