set nocompatible

" Vundle settings

filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/nerdtree'


filetype plugin indent on

" Enables backspace to delete the previous character
set bs=2 

" Enable line numbering
set number

" Enable highlighting the current line
set cursorline

" Turn off wordwrap, currently disabled
set wrap!

" Turn on smart indent, tabs, set sane tab settings
set smartindent
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4
filetype indent on

" nerdtree settings
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Syntax highlighting on
syn on

" noexpandtab for makefiles
autocmd FileType make set noexpandtab

" shorter tabs for html and js
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2

" Colorscheme
set background=dark
set t_Co=256
colorscheme jellybeans

" Bind crtl-m to default make target
noremap <C-m> :wa<CR>:make tests<CR>
