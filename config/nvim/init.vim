source ~/.config/nvim/plugins.vim
set nocompatible " not compatible with vi
set autoread " detect when a file changed

" stop acting backspace insane
set backspace=indent,eol,start

" Map more leader keys
let mapleader=','
let g:mapleader=','

set textwidth=120
" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set completeopt+=longest


" Disable the mouse
if has('mouse')
	set mouse=""
endif

" TODO: need to add clipboard feature

" File type specific settings
augroup configgroup
	autocmd!
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab

	" automatically resize panes on resize
	autocmd VimResized * exe 'normal! \<c-w>='
	" save all files on focus lost, ignoring warnings about untitled buffers
	autocmd FocusLost * silent! wa
	autocmd! BufWritePost * Neomake
augroup END

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

noremap Q <NOP> " disable Ex mode

inoremap jk <esc> " remap exc
nmap <leader>, :w<cr> " shortcut to save

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
map <leader>es :source ~/.config/nvim/init.vim<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<cr>