"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen must be called before enabling filetype detection
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Toggle on/off showing invisibles 
nmap <leader>l :set list!<CR>

" Make .vimrc changes take place immediately
if has("automcd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Edit .vimrc in a new tab using "<leader>v"
nmap <leader>v :tabedit $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show line numbers
set number
" only consider case if first word is capitalized
set ignorecase smartcase
set wildmenu
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
" Drupal is code typically 80 characters wide
" set columns=80
" Wrap text
set wrap
" Don't split words
set lbr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme desert


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Drupal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif
syntax on

