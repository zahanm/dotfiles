
set nocompatible " be iMproved

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
