" Activate Pathogen plugin (should be at top of .vimrc)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set default color scheme
"colorscheme wombat
colorscheme desert

" Set default fonts based on OS
let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
  set guifont=Menlo:h15
  set lines=44 columns=160
elseif os == "Linux"
  " Looks good in Debian
  set guifont=Monospace\ 12
  set lines=30 columns=130
  " Make the width of the text file = the column width
  " set textwidth=140
  " Used with Ubuntu
  " set guifont=Ubuntu\ Mono\ 14
  " set lines=39 columns=150
endif

" show line numbers
set number

" show the line and column number of the cursor position
set ruler

" Wrap text
set wrap
set linebreak

" list disables linebreak
set nolist

" Don't split words
set lbr

" Set default window position (upper left) and size
winpos 0 0

" turn on word highlighting
set hlsearch

" make cursor a line rather than a square
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

" Enable automatic folds
" set foldmethod=syntax
" set foldlevelstart=1
" let javaScript_fold=1         " JavaScript
" let php_folding=1             " PHP


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JavaScript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-javascript plugin settings
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Drupal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Drupal-specific settings
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Change to comply with PSR-0
"set tabstop=4
"set shiftwidth=4

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

" Highlight column 80
set colorcolumn=80

" Highlight redundant whitespaces and tabs
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcut Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set <Leader>
let mapleader = "\\"
let g:mapleader = "\\"
"let mapleader = ","
"let g:mapleader = ","

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G

" Allow for use of copy and paste
vmap <C-c> "+y
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Not sure...
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

" Turn on NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Set commenting key combo
map <Leader>/ <plug>NERDCommenterToggle

" always open NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Application Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Word Processing mode
func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  "set thesaurus+=/Users/mtift/.vim/thesaurus/mthesaur.txt
  set thesaurus
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
endfu
com! PM call WordProcessorMode()

" vdebug settings
if !exists("g:vdebug_options")
  let g:vdebug_options = {}
endif
let g:vdebug_options["break_on_open"] = 0
let g:vdebug_options['max_children'] = 128
":let g:vdebug_features['max_depth'] = 2048
":let g:vdebug_options['watch_window_style'] = 'compact'
":let g:vdebug_options['server'] = ''
