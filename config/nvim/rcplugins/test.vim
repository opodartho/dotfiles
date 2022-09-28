Plug 'vim-test/vim-test'

let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

let test#neovim#term_position = "vert botright"
