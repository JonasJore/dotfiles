set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'git@github.com:rking/ag.vim.git'
Plugin 'frazrepo/vim-rainbow'
Plugin 'git@github.com:ajh17/VimCompletesMe.git'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'

call vundle#end()
filetype plugin indent on

syntax on
syntax sync minlines=1000
set background=dark "dark background
set number "display line number
highlight LineNr ctermfg=grey
set history=500 "line history for vim
set updatetime=250 "updatetime
"filetype plugin
filetype plugin on
filetype indent on
set autoread "updates when file is changed from outside
set ignorecase "ignores case when searhcing files
set magic "use magic for regular expressions
"matching brackets
set showmatch
set mat=2
"no sound on errors...
set noerrorbells
set novisualbell
"backup functions disabled
set nobackup
set nowb
set noswapfile
set expandtab "spaces instead of tabs
set smarttab "smart tabbing
" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set ai "auto indentation
set si "smart indentation
set wrap "wrap lines
"Quicksave <S-s>
nnoremap <S-s> :w<CR>