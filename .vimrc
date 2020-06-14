set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
set splitright
set nu
set encoding=utf-8
set relativenumber
set nowrap
set smartcase
set noswapfile
set noerrorbells
set noshowmatch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set updatetime=50

" remaps
nnoremap <SPACE> <Nop>
nmap <F6> :NERDTreeToggle<CR>


call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/coc.nvim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
colorscheme onedark

" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_packages']
let g:ackprg = 'ag --nogroup --nocolor --column'
let mapleader=" "

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
