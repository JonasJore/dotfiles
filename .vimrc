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

"automated vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

"vim-plug config
call plug#begin('.vim/vim_plug')

"dracula-theme for vim
"Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
