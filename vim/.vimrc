set nocompatible

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

set t_Co=256

" Syntax highlighting on
syn on

" noexpandtab for makefiles
autocmd FileType make set noexpandtab

" shorter tabs for html and js
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2

" Use the lucius schole
set background=dark
colorscheme lucius

" Bind crtl-m to default make target
noremap <C-m> :wa<CR>:make tests<CR>


