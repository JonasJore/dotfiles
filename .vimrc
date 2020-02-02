set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()

filetype plugin indent on
syntax enable "enable syntax processing
syntax sync minlines=1000
set background=dark "dark background
set number "display line number
highlight LineNr ctermfg=grey
set history=500 "line history for vim
set updatetime=250 "updatetime
filetype plugin on "filetype plugin
filetype indent on
set autoread "updates when file is changed from outside
set ignorecase "ignores case when searhcing files
set magic "use magic for regular expressions
set showmatch "highlights matching bracket pairs
set mat=2
set noerrorbells "no sound on errors...
set novisualbell
set nobackup "backup functions disabled
set nowb
set noswapfile
set expandtab "spaces instead of tabs
set smarttab "smart tabbing
" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set ai "auto indentation
set si "smart indentation
set wrap "wrap lines
"Quicksave <S-s>
nnoremap <S-s> :w<CR>
set incsearch " search as characters are entered
set hlsearch " highlight matches

" using the arrow keys is bad for you!
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
