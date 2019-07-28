set nocompatible
set nu
autocmd! bufwritepost ~/.config/i3/config !i3 restart
autocmd! bufwritepost ~/.Xresources !xrdb -load ~/.Xresources
autocmd! bufwritepost ~/.zshrc	!source ~/.zshrc
autocmd! bufwritepost ~/bin/custom-alias !source ~/bin/custom-alias
set nocp
execute pathogen#infect()
source ~/.vim/autoload/supertab.vim
filetype on
set bg=dark
au BufNewFile,BufRead *Pkgfile set filetype=sh

filetype plugin indent on
set showmode
set nu
set ai
set sc
set noincsearch
set noexpandtab
set backspace=indent,eol,start
syntax on
colorscheme distinguished 
set mouse=a
let mapleader=" "
set hidden
set history=10000
filetype indent on
filetype plugin on
set linebreak 
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set nohlsearch
set showmatch
set laststatus=2
set noshowmode 
set undofile
set undodir=~/.vim/undodir
set viminfo='10,\"100,:20,%,n~/.viminfo
set nobackup
set whichwrap=b,s,<,>,[,]
set laststatus=2
let g:powerline_pycmd = 'py3'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
:noremap <leader>u :w<Home>silent <End> !urlview<CR>

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

"augroup resCur
"  autocmd!
"  autocmd BufWinEnter * call ResCur()
"augroup END
autocmd FileType python set breakindentopt=shift:4
command! -range=% SP  <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\n' | xclip -i -selection clipboard
command! -range=% CL  <line1>,<line2>w !curl -F 'clbin=<-' https://clbin.com | tr -d '\n' | xclip -i -selection clipboard
command! -range=% VP  <line1>,<line2>w !curl -F 'text=<-' http://vpaste.net | tr -d '\n' | xclip -i -selection clipboard
command! -range=% PB  <line1>,<line2>w !curl -F 'c=@-' https://ptpb.pw/ | sed -n 's/^url: //p' | xclip
command! -range=% TB  <line1>,<line2>w !fb
" vim: set ft=vim :
