set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'derekwyatt/vim-scala'

"Bundle 'leo256'
" Bundle 'tpope/vim-vividchalk'
Bundle 'morhetz/gruvbox'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'frederich/gvimfullscreen_win32'
Bundle 'xolox/vim-shell'
Bundle 'mru.vim'
Bundle 'xolox/vim-misc'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'fisadev/vim-ctrlp-cmdpalette'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
" Bundle 'Lokaltog/powerline'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'closetag.vim'
Bundle 'mustache/vim-mode'
Bundle 'myusuf3/numbers.vim'
Bundle 'YankRing.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'dsawardekar/ember.vim'
" Coffee
Bundle 'kchmck/vim-coffee-script'
" Scala
Bundle 'neaket/sbt-vim'
Bundle 'gre/play2vim'
" Python
Bundle 'klen/python-mode'
" Stylus
Bundle 'wavded/vim-stylus'
" JavaScript
"Bundle 'wookiehangover/jshint.vim'
Bundle 'Shutnik/jshint2.vim'

"Vmux
Bundle 'benmills/vimux'

set tags=tags;/
set background=dark
set t_Co=256
" colorscheme vividchalk
colorscheme gruvbox
" colorscheme solarized
" ...
syntax enable
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" set guifont=NEEP\ 13
set guifont=Source_Code_Pro_Semibold:h12:cANSI
" set guifont=Source_Code_Pro_for_Powerline:h12:cANSI
" set guifont=Sauce\ Code\ Powerline\ Semibold:h12
let g:scala_sort_across_groups=1

let g:scala_first_party_namespaces='\(controllers\|views\|models\|util\|de.\|com\.indicle\)'
" autocmd BufRead,BufNewFile *.scala set filetype=scala

" sort scala imports on save of a scala file
autocmd BufWritePre,FileWritePre *.scala :SortScalaImports

" Strip whitespace from the end of files
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" let g:ctrlp_custom_ignore = '(bin|target)'

" Easily move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let NERDTreeIgnore = ['\.pyc$']

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)|target|bin|node_modules|bower_components$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'a_bad_sym_link$',
  \ }

" Powerline settings
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

set tabstop=2
set shiftwidth=2
set expandtab
set number

" disable vim backup
"set noswapfile

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>

let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>


" Save ctags in .git directory
" ctags -R -f ./.git/tags .

set cursorline

"powerline symbols
"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
let g:airline#extensions#branch#enabled = 0

set encoding=utf-8
set fileencodings=utf-8

" Treat camel case as words
" Use one of the following to define the camel characters.
" Stop on capital letters.
let g:camelchar = "A-Z"
" Also stop on numbers.
let g:camelchar = "A-Z0-9"
" Include '.' for class member, ',' for separator, ';' end-statement,
" and <[< bracket starts and "'` quotes.
let g:camelchar = "A-Z0-9.,;:{([`'\""
nnoremap <silent><C-Left> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-Left> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-Right> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o
