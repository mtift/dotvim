" Activate Pathogen plugin (should be at top of .vimrc)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set default color scheme
colorscheme desert

" Set default fonts based on OS
let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
  set guifont=Menlo:h16
  set lines=40 columns=140
elseif os == "Linux"
  " Looks good in Debian
  set guifont=Monospace\ 12
  set lines=30 columns=140
  " Make the width of the text file = the column width
  set textwidth=140
  " Used with Ubuntu
  "set guifont=Ubuntu\ Mono\ 14
  "set lines=35 columns=160
endif

" turn on word highlighting
nmap <silent> <leader>n :set hlsearch!<CR>

" show line numbers
set number

" Wrap text
set wrap
" Don't split words
set lbr

" always open NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Set default window position (upper left) and size
winpos 0 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Drupal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Drupal-specific settings
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif
syntax on

let g:syntastic_phpcs_conf="--standard=DrupalCodingStandard"
" let g:syntastic_phpcs_disable=1

" Drupal is code typically 80 characters wide
" columns=80



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcut Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow for use of cut and past in gvim
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" Not sure...
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l
map <Leader>n :NERDTreeToggle<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable beeping
set noeb vb t_vb=

" only consider case if first word is capitalized
set ignorecase smartcase
set wildmenu
set smartindent
" indent/outdent to nearest tabstops
set shiftround

" Fix Newline At End Of File error 
autocmd FileType php setlocal noeol binary fileformat=dos

" View Processing .pde documents as Java code
if has("autocmd")
  autocmd BufRead,BufNewFile *.pde set filetype=java
endif

" Turn on CSS auto-complete
set omnifunc=csscomplete#CompleteCSS


