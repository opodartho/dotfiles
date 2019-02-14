Plug 'neomake/neomake'

" Neomake
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_slim_enabled_makers = ['slimlint']
let g:neomake_javascript_eslint_maker = {
  \ 'args': ['--no-colors', '--reporter', 'inline', '--preset=airbnb'],
  \ 'errorformat': '%f: line %l\, col %c\, %m',
\}
let g:neomake_javascript_enabled_markers = ['eslint']
