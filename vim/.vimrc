syntax enable
set number "display line number

"automated vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

"vim-plug config
call plug#begin('.vim/vim_plug')

"dracula-theme for vim
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
