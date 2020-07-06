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
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'prettier/vim-prettier'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

call vundle#end()
filetype plugin indent on

" Use space as leader
let mapleader = " "

" Autocompletion of commands
set wildmenu
set wildmode=longest,list,full

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

" Display tabs as arrows
set list
set listchars=eol:¬,tab:▸\ 

" python settings
autocmd FileType python setl nosmartindent

" nerdtree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>i :NERDTreeFind<CR>
let g:NERDTreeWinSize = 45

" ctrlp settings
let g:ctrlp_map = '<leader>p'
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
nmap <leader>o :Ack!<Space>
"" Use the silver searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Vim fugitive settings
nmap <leader>b :Gblame

" Syntax highlighting on
syn on

" Workaround for typescript in vim
autocmd BufNewFile,BufRead *.tsx   set filetype=typescript

" noexpandtab for make, go
autocmd FileType make set noexpandtab
autocmd FileType go set noexpandtab

" Tabstops
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType yaml set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType typescript set tabstop=2 shiftwidth=2
autocmd FileType vue set tabstop=2 shiftwidth=2
autocmd FileType scss set tabstop=2 shiftwidth=2
autocmd FileType py set tabstop=4 shiftwidth=4
autocmd FileType go set tabstop=4 shiftwidth=4

" Colorscheme
set background=dark
set t_Co=256
colorscheme jellybeans

" omnicompletion
" inoremap . .<C-x><C-o>
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Youcompleteme
let g:ycm_semantic_triggers =  {
    \   'c' : ['->', '.'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'cs,java,javascript,python,go' : ['.'],
    \   'html': ['<', '"', '</', ' '],
    \   'vim' : ['re![_a-za-z]+[_\w]*\.']
    \ }

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
