" Activate Pathogen plugin (should be at top of .vimrc)
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
execute pathogen#infect()
"set nocompatible


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Define autocmd for some highlighting *before* the colorscheme is loaded
augroup VimrcColors
au!
  autocmd ColorScheme * highlight AdWords guibg=#4b5284
  autocmd ColorScheme * highlight Nouns ctermbg=DarkMagenta guibg=DarkMagenta
  autocmd ColorScheme * highlight Prepositions ctermbg=DarkRed guibg=DarkRed
  autocmd ColorScheme * highlight ToBe ctermbg=DarkCyan guibg=DarkCyan
  autocmd ColorScheme * highlight Waste ctermbg=DarkBlue guibg=DarkBlue
  autocmd ColorScheme * highlight Weasel ctermbg=DarkGreen guibg=DarkGreen
  autocmd ColorScheme * highlight Omit guibg=#242424
augroup END

" Set default color scheme
colorscheme wombat
"colorscheme desert

" Get the name of the operating system
let os = substitute(system('uname'), "\n", "", "")

" GUI-specific settings
if has("gui_running")
  if os == "Linux"
    " Looks good in Debian
    set guifont=Monospace\ 12
    "set lines=30 columns=130
    set lines=99 columns=150
    " Make the width of the text file = the column width
    set textwidth=130
    " Used with Ubuntu
    " set guifont=Ubuntu\ Mono\ 14
  elseif os == "Darwin"
    set guifont=Menlo:h15
    set lines=30 columns=140
  elseif os =~ "CYGWIN"
    " Used on Windows
  endif

  " make cursor a line rather than a square
  if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  endif
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

" Enable automatic folds
" set foldmethod=syntax
" set foldlevelstart=1
" let javaScript_fold=1         " JavaScript
" let php_folding=1             " PHP



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
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.theme set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on

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
" Find a way to map <C-R>" to C-v on the command line

" Not sure...
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

" Set commenting key combo
map <Leader>/ <plug>NERDCommenterToggle

" Turn on NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Add a space when commenting
let g:NERDCustomDelimiters = {
  \ 'r': {'left': '# '},
  \ 'php': {'left': '// '}
\ }

" always open NERDTree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

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
"set fileformats+=dos

" View Processing .pde documents as Java code
if has("autocmd")
  autocmd BufRead,BufNewFile *.pde set filetype=java
endif

" Allow for folding Markdown files in Vim
if has("autocmd")
  filetype plugin indent on
endif
" Open with all folds open
" For additional options, see http://vimcasts.org/episodes/how-to-fold
autocmd BufWinEnter * normal! zR

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

" Disable backup
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.

" Editing a protected file as 'sudo'
cmap SW w !sudo tee % >/dev/null<CR>

" Word Processing mode
func! WordProcessorMode()
  setlocal formatoptions=1
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
  set colorcolumn=0
  let g:online_thesaurus_map_keys = 0
  let g:neocomplete#disable_auto_complete = 1
  nnoremap <Leader>t :OnlineThesaurusCurrentWord<CR>

  " Highlight duplicate words
  let s:dups=matchadd('Error', '\v(<\w+>)\_s*<\1>', 10)

  " Highlight [weasel words](http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/)
  let s:weasel=matchadd('Weasel', '\c\v<many>|<various>|<very>|<fairly>|<several>|<extremely>|<exceedingly>|<quite>|<remarkably>|<few>|<surprisingly>|<mostly>|<largely>|<huge>|<tiny>|<((are>|<is) a number)>|<excellent>|<interestingly>|<significantly>|<substantially>|<clearly>|<vast>|<relatively>|<completely>|<obviously>|<note that>|<particular>|<specific>|<manner>|<purposes>|<that is>|<which are>|<that are>|<differently>|<formally>|<in another words>|e\.g\.|i\.e\.|almost|etc\.|\w+ly', 10)

  " Highlight to be verbs
  let s:tobe=matchadd('ToBe', '\c\v<to be>|<am>|<is>|<are>|<was>|<were>|<be>|<being>|<been>\v\c', 10)

  " Waste Words from http://writersdiet.com
  let s:waste=matchadd('Waste', '\c\v<it>|<there>|<that>|<this>\v\c', 10)

  " Prepositions from http://writersdiet.com
  let s:prepositions=matchadd('Prepositions', '\c\v<in>|<by>|<for>|<of>|<to>|<betwee<|<during>|<on>|<from>|<with>\v\c', 10)

  " 'Ad words' from http://writersdiet.com (these don't seem as helpful)
  "let s:nouns=matchadd('AdWords', '\c\v\w+(able|ful|ible|ive|less|ous)\v\c', 10)

  " Nouns from http://writersdiet.com
  let s:nouns=matchadd('Nouns', '\c\v\w+(ion|ism|ty|ment|ness|ance|ence)\v\c', 10)

  " Omit some words
  let s:omit=matchadd('Omit', '\c\v<Foundation>|<is released>|<community>|<Tolerance>|<tolerance>\c\v', 10)

endfu
com! WP call WordProcessorMode()

" Syntastic settings
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1

let g:syntastic_phpcs_conf="--standard=DrupalCodingStandard"
" let g:syntastic_phpcs_disable=1
let g:syntastic_markdown_checkers = ['proselint']

" The items listed in this array will not be checked by proselint
" See https://github.com/amperser/proselint/tree/master/plugins/vim
let g:syntastic_text_proselint_quiet_messages = {
  \ 'regex': [
  \   '\m^typography\.symbols\.curly_quotes',
  \   '\m^typography\.symbols\.multiplication_symbol',
  \   '\m^leonard\.exclamation',
  \ ] }

" Enable neocomplete on startup
let g:neocomplete#enable_at_startup = 1

" vdebug settings
if !exists("g:vdebug_options")
  let g:vdebug_options = {}
endif
let g:vdebug_options["break_on_open"] = 0
let g:vdebug_options['max_children'] = 128
":let g:vdebug_features['max_depth'] = 2048
":let g:vdebug_options['watch_window_style'] = 'compact'
":let g:vdebug_options['server'] = ''



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Digraphs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To type a character such as ṃ, type CTRL-k m ,
" The number (e.g. 7747) is the 'decimal' version of the character
" For more information, see:
"   http://www.chakra.lv/blog/2016/10/19/transliterating-sanskrit-into-russian
"   https://r12a.github.io/apps/conversion/
"   https://sanctum.geek.nz/arabesque/special-characters-in-vim

" Built in digraphs:
" digraph A-  256 " Ā
" digraph a-  257 " ā
" digraph I-  298 " Ī
" digraph i-  299 " ī
" digraph U-  362 " Ū
" digraph u-  363 " ū
" digraph M. 7744 " Ṁ
" digraph m. 7745 " ṁ
" digraph N. 7748 " Ṅ
" digraph n. 7749 " ṅ
" digraph N?  209 " Ñ
" digraph n?  241 " ñ
" digraph S'  346 " Ś
" digraph s'  347 " ś
" digraph c, -> ç
" digraph e' -> é
" digraph o^ -> ô
" digraph a! -> à
" digraph u: -> ü
" digraph =e -> €

" Custom digraphs:
digraph R, 7770 " Ṛ
digraph r, 7771 " ṛ
digraph R- 7772 " Ṝ
digraph r- 7773 " ṝ
digraph L, 7734 " Ḷ
digraph l, 7735 " ḷ
digraph L- 7736 " Ḹ
digraph l- 7737 " ḹ
digraph M, 7746 " Ṃ
digraph m, 7747 " ṃ
digraph H, 7716 " Ḥ
digraph h, 7717 " ḥ
digraph T, 7788 " Ṭ
digraph t, 7789 " ṭ
digraph D, 7692 " Ḍ
digraph d, 7693 " ḍ
digraph N, 7750 " Ṇ
digraph n, 7751 " ṇ
digraph S, 7778 " Ṣ
digraph s, 7779 " ṣ
