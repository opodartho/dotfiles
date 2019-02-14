Plug 'scrooloose/nerdtree'

nnoremap <silent><Leader>k :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

