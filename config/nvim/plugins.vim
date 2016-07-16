call plug#begin('~/.config/nvim/plugged')
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'

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

	Plug 'majutsushi/tagbar'

	Plug 'garbas/vim-snipmate' | Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim'
	Plug 'honza/vim-snippets'

	Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
call plug#end()


" Plugins settings

" NERDTree
let g:NERDTreeQuitOnOpen=0 " close NERDTree after a file is opened
let NERDTreeShowHidden=0 " stop display hidden files in NERDTree
let NERDTreeIgnore = ['\.js.map$'] " remove some files by extension
nmap <silent> <leader>k :NERDTreeToggle<cr> " Toggle NERDTree
nmap <silent> <leader>y :NERDTreeFind<cr> " expand to the path of the file in the current buffer

" CtrlP
nmap <C-b> :CtrlPBuffer<cr>
let g:ctrlp_dotfiles=1
let ctrlp_working_path_mode="ra"

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

" Tagbar toggle
nmap <F8> :TagbarToggle<CR>

