set shiftwidth=2
set tabstop=2
set expandtab

set background=dark
set showcmd
set autowrite
set textwidth=80

set smartcase

set scrolloff=2

set wildmode=longest,list
set wildmenu

set autoindent
set smartindent

set autoread

if has ("autocmd")
  " File type detection. Indent based on filetype. Recommended.
  filetype plugin indent on
endif

set incsearch
set hlsearch

"Column width of 80 chars"
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"Trailing whitespace"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

syn match tab display "\t"
hi link tab Error

syntax on

