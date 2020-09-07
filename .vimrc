set nocompatible
filetype off

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
set belloff=all
set noshowmatch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set updatetime=50
set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStats()}
set background=dark

" remaps
let mapleader=" "

nmap <F6> :NERDTreeToggle<CR>
nnoremap <SPACE> <Nop>
nnoremap <C-R> :GFiles<CR>
nnoremap <C-h> :Rg<CR>
nnoremap <C-/> :TComment<CR>
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-reference)
nmap gt <Plug>(coc-type-definition)

call plug#begin("~/.vim/plugged")
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/fzf.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
call plug#end()
 
filetype plugin indent on
syntax on
colorscheme gruvbox

let NERDTreeIgnore=['\.pyc$', '\~$', 'node_packages']
let g:ale_fix_on_save=1
let g:ackprg = 'ag --vimgrep'
let g:coc_disable_startup_warning=1

let g:ale_linters = {
     \ 'javascript': ['eslint'],
     \}
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-python',
    \ 'coc-json',
     \ 'coc-css',
    \]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
endif

function TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return L:counts.total == 0 ? 'all good' : printf(
               \   '%dW %dE',
               \   all_non_errors,
               \   all_errors
               \)
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction
