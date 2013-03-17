" Activate Pathogen plugin (should be at top of .vimrc)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Adding plugins using git submodules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cd ~/.vim
" git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
" add the line 'ignore = dirty' to the .gitmodules file for each submodule
" git add .
" git commit -m 'Install Fugitive.vim bundle as a submodule.'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set default color scheme
colorscheme wombat

" Set default fonts based on OS
let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
  set guifont=Menlo:h16
  " set lines=40 columns=140
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

" turn on word highlighting
set hlsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Drupal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Drupal-specific settings
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

if has("autocmd")
  " Use PHP for .module, .install, and other Drupal file types
  augroup module:wq
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on

let g:syntastic_phpcs_conf="--standard=DrupalCodingStandard"
" let g:syntastic_phpcs_disable=1

" Move down a single row on the screen (not the next line number)
nmap j gj
nmap k gk

" Drupal *code* comments are typically less than 80 characters wide
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
":match OverLength '\(^\(\s\)\{-}\(*\|//\|/\*\)\{1}\(.\)*\(\%81v\)\)\@<=\(.\)\{1,}$'

" Highlight *all* chars that go over the 80-column limit
:highlight OverLength ctermbg=blue ctermfg=white guibg=blue guifg=white
:match OverLength '\%81v.*'

" Highlight redundant whitespaces and tabs
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcut Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set <Leader>
let mapleader = "\\"
let g:mapleader = "\\"

" Allow for use of cut and past in gvim
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" Not sure...
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

" Turn on NERDTree
map <Leader>n :NERDTreeToggle<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable beeping
set noeb vb t_vb=

" only consider case if first word is capitalized
set ignorecase smartcase
set wildmenu
" indent/outdent to nearest tabstops
set shiftround

" Fix Newline At End Of File error
"autocmd FileType php setlocal noeol binary fileformat=dos
"autocmd FileType inc setlocal noeol binary fileformat=dos
set fileformats+=dos

" View Processing .pde documents as Java code
if has("autocmd")
  autocmd BufRead,BufNewFile *.pde set filetype=java
endif

" Turn on CSS auto-complete
set omnifunc=csscomplete#CompleteCSS

filetype plugin on

" Remember last cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Disable swap file creation
set noswapfile
