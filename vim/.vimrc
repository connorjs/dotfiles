if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if &shell =~# 'fish$'
    set shell=sh
endif

set number
set ruler
set visualbell
set encoding=utf-8
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'dag/vim-fish'
call plug#end()

