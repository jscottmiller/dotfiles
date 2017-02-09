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
Plugin 'mileszs/ack.vim'
Plugin 'duganchen/vim-soy'
Plugin 'tomlion/vim-solidity'
Plugin 'posva/vim-vue'
Plugin 'w0rp/ale'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" English spell checking
set spell spelllang=en_us

" Ignore case when searching
:set ignorecase

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

" python settings
autocmd FileType python setl nosmartindent

" nerdtree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-i> :NERDTreeFind<CR>
let g:NERDTreeWinSize = 45

" ctrlp settings
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" ack settings
"" Don't open first result by default
map <C-o> :Ack!<Space>
"" Use the silver searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

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
" noremap <C-m> :wa<CR>:make tests<CR>
