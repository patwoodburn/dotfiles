set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

"general settings
set nu
set ruler
syntax enable
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set showcmd
set noswapfile

"better splits
set splitright
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set t_Co=256
set colorcolumn=80
highlight ColorColumn ctermbg=9

"shouldn't need this but might be nice
if has("mouse")
  set mouse=a
endif

"vundle config
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'bronson/vim-trailing-whitespace'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'w0rp/ale'
call vundle#end()
filetype plugin indent on

"nerd tree config
map <C-t> :NERDTreeTabsToggle<CR>
"airline config
set laststatus=2

colorscheme gotham
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
au VimEnter *  NERDTree

"vim wson support
autocmd BufNewFile,BufRead *.json set ft=javascript

"vim make settings
autocmd FileType make setlocal noexpandtab
