set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
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
set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" remaps
let mapleader=" "

nmap <F6> :NERDTreeToggle<CR>
nnoremap <SPACE> <Nop>
nnoremap <C-R> :GFiles<CR>
nnoremap <C-h> :Rg<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gr <Plug>(coc-type-definition)

call plug#begin("~/.vim/plugged")

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle required
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()            " required
filetype plugin indent on    " required

syntax on
colorscheme onedark

" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_packages']
let g:ackprg = 'ag --vimgrep'

function TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" linters
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ 'javascript': ['eslint'],
    \ 'java': ['google-java-format'],
    \}

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

