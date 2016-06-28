call plug#begin('~/.config/nvim/plugged')
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
	Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

	Plug 'opodartho/neomake'
	Plug 'opodartho/vim-linenum'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'altercation/vim-colors-solarized'
call plug#end()


" Plugins settings

" NERDTree
let g:NERDTreeQuitOnOpen=0 " close NERDTree after a file is opened
let NERDTreeShowHidden=1 " show hidden files in NERDTree
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
