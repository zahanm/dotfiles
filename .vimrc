
" For Vundle

set shell=bash
set nocompatible " be iMproved
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" put Vundle plugins in here
Plugin 'dag/vim-fish'

call vundle#end()
" File type detection. Indent based on filetype. Required by Vundle
filetype plugin indent on

" General config from here on out

set shiftwidth=2
set tabstop=2
set expandtab

set background=dark
set showcmd
set autowrite

" line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey guifg=DarkGrey

" soft wrapping
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

set smartcase

set scrolloff=2

set wildmode=longest,list
set wildmenu

set autoindent
set smartindent

set autoread

" search settings
set incsearch
set hlsearch
set ignorecase

" Column width of 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

syn match tab display "\t"
hi link tab Error

syntax on

" facebook specific
set tags=~/www/tags
let g:fb_hack_on = 0 "disables Hack check on save

