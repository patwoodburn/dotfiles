set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

set nu
set ruler
syntax enable
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set showcmd
set noswapfile

set splitright
set splitbelow

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set t_Co=256
set colorcolumn=80

if has("mouse")
  set mouse=a
endif

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

