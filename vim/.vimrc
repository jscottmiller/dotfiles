set nocompatible
filetype off 

" Vundle settings

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My bundles
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'

call vundle#end()
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

" ag settings
map <C-o> :Ag 

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
