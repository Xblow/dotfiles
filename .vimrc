"========================= General Settings ==============================

set nocompatible
set ruler
set history=200		" keep 200 lines of command line history
set backspace=indent,eol,start
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set suffixes-=.h
set suffixes-=.obj
set tabstop=2  			" show existing tab with 4 spaces width
set shiftwidth=2		" when indenting with '>', use 4 spaces width
set expandtab 			" On pressing tab, insert 4 spaces
set ignorecase		  " reset to ignore case
set smartcase		  	" will not ignore case if there is an upper case letter
set clipboard=unnamedplus
if &co > 80
  set number          " Display line numbers if terminal is wide enough.
  set hidden          " Maintain undo history of all buffers (gets hidden after buffer change)
endif

"========================= Save directories ==============================

if exists('$XDG_CACHE_HOME')
  let &g:directory=$XDG_CACHE_HOME
else
  let &g:directory=$HOME . '/.cache'
endif

let &g:undodir=&g:directory . '/vim/undo//'
let &g:backupdir=&g:directory . '/vim/backup//'
let &g:directory.='/vim/swap//'

if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif
if ! isdirectory(expand(&g:backupdir))
  silent! call mkdir(expand(&g:backupdir), 'p', 0700)
endif
if ! isdirectory(expand(&g:undodir))
  silent! call mkdir(expand(&g:undodir), 'p', 0700)
endif

"========================= Plugins & bindings ==============================

source $HOME/.vim/rc-files/keybindings.vim      " Keybindings
source $HOME/.vim/rc-files/plugin-startup.vim   " Plugins

"========================= Other features ==============================

colorscheme gruvbox

"--- Switching syntax off for large files
autocmd BufWinEnter * if line2byte(line("$") + 1) > 500000 | syntax clear | endif

"--- Enabling mouse
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
autocmd VimEnter * call ToggleMouse()

" GNU identing style for cpp files
function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
  setlocal shiftwidth=2
  setlocal tabstop=4
endfunction
au FileType c,cpp call GnuIndent()

set tags=tags;       " Command `;` makes vim search for tags file in the upper directories

" For vim on Alacritty terminal: ttymouse=sgr
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ\:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

