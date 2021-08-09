set number
syntax enable 
set cursorline
set showmatch
set incsearch
set hlsearch
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
nnoremap <leader><space> :nohlsearch<CR>
filetype plugin indent on

call plug#begin()

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Theme
Plug 'arcticicestudio/nord-vim'

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Theme
colorscheme nord 

" NERDTree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-i> :PlugInstall<CR>
