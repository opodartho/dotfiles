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
