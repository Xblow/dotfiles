"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" Configuration for vim/neovim
" Author: Andrei Popescu

" General {{{
" ===========
set nocompatible
set backspace=indent,eol,start
set ruler
set history=200                       " command line history
set tabstop=2                         " show existing tab # spaces width
set shiftwidth=2                      " when indenting with '>', use 4 spaces width
set expandtab                         " on pressing tab, insert 4 spaces
set ignorecase                        " reset to ignore case
set smartcase                         " ignore case only if no capital letters
" set foldmethod=marker               " fond using {{{ }}} markers
set updatetime=300                    " faster completion
set clipboard=unnamedplus
set incsearch
if &co > 80                           " if terminal shows 80+ lines
  set number                          " display line numbers
endif
set hidden                            " have full undo history
set nowrapscan                        " stop search at bottom
" let &titlestring = @%
" set title
                                      "     (gets hidden after buffer change)
set tags=tags;                        " command `;` makes vim search for tags file
" set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
" set list listchars=nbsp:¬,trail:·,extends:>
" set diffopt+=iwhite                 " Ignore whitespace whilst diffing
                                      "     in the upper directories
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
" }}}
" Backups, History, Swaps {{{
" ======================
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
" }}}
" Basic Keybindings {{{
" =====================

"--- Make search behaviour 'very unmagic' (search for precise patterns)
nnoremap / /\V
nnoremap ? ?\V

"--- Transversing vim buffer list
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"--- Close buffer with window untouched
command! Bd :bp | :sp | :bn | :bd

"--- Clear command line
" nnoremap <leader><C-l>

"--- Make cursor stay while rolling page
nnoremap <C-e> <C-e>j
vnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k
vnoremap <C-y> <C-y>k

"--- Limit quickfix window height
au FileType qf call AdjustWindowHeight(5, 12)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"--- Declare <Space> as leader key
nmap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"

"--- Highlighting bindings
nnoremap <silent><expr> <leader>hh (&hls && v:hlsearch ? ':nohls'
                                                      \: ':set hls')."\n"
nnoremap <expr> <leader>hl (&spell ? ':set nospell'
                                  \: ':set spell')."\n"
nnoremap <expr> <leader>hr (&relativenumber ? ':set norelativenumber'
                                           \: ':set relativenumber')."\n"
nnoremap <expr> <leader>hn (&number ? ':set nonumber'
                                   \: ':set number')."\n"
nnoremap <expr> <leader>hw (&wrap ? ':set nowrap' : ':set wrap')."\n"
" if filereadable($HOME/.config/nvim/scripts/HighlightWhitespace.vim)
source $HOME/.config/nvim/scripts/HighlightWhitespace.vim
    nnoremap <silent> <leader>hs :call ToggleHighlightWhitespace()<cr>
    nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" endif

"--- Switch between windows using alt
if has('nvim')
    tnoremap <C-[> <C-\><C-n>
    " tnoremap <A-h> <C-\><C-N><C-w>h
    " tnoremap <A-j> <C-\><C-N><C-w>j
    " tnoremap <A-k> <C-\><C-N><C-w>k
    " tnoremap <A-l> <C-\><C-N><C-w>l
endif
" inoremap <A-h> <C-\><C-N><C-w>h
" inoremap <A-j> <C-\><C-N><C-w>j
" inoremap <A-k> <C-\><C-N><C-w>k
" inoremap <A-l> <C-\><C-N><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

" Open file if doesn't exist
noremap <leader>gf :tabe <cfile><cr>

" Open neovimrc (this file)
nnoremap <leader>ev :tabe $MYVIMRC<cr>

"--- Open terminal in nvim
if has('nvim')
    nnoremap <leader>tb  :terminal<cr>
    nnoremap <leader>ts  :split term://bash<cr>
    nnoremap <leader>tvb :vsplit term://bash<cr>
    nnoremap <leader>tvp :vsplit term://python<cr>
    nnoremap <leader>teb :edit term://bash<cr>
    nnoremap <leader>tep :edit term://python<cr>
endif

"--- Allow vim work as usual with cyrillic layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ\:
           \,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" }}}
" Colours {{{
colorscheme wuye
" }}}
" Plugins {{{
" ===========
call plug#begin('~/.vim/plugged')

source $HOME/.config/nvim/rc/fzf.vim                   " general fzf support
source $HOME/.config/nvim/rc/fugitive.vim              " git support
source $HOME/.config/nvim/rc/signify.vim               " git change highlighting
source $HOME/.config/nvim/rc/dispatch.vim              " asynchronous make procedure
source $HOME/.config/nvim/rc/vimtex.vim                " TeX engine
source $HOME/.config/nvim/rc/ultisnips.vim             " Snippets engine
Plug 'tpope/vim-unimpaired'                            " ?
Plug 'tpope/vim-repeat'                                " dot-command to repeat any action
Plug 'tomtom/tcomment_vim'                             " comment shortcuts
Plug 'machakann/vim-sandwich'                          " manipulating surrounds
source $HOME/.config/nvim/rc/colorizer.vim             " HEX colors
source $HOME/.config/nvim/rc/easymotion.vim            " jump around file
source $HOME/.config/nvim/rc/quick-scope.vim           " jump around file
source $HOME/.config/nvim/rc/lightline.vim             " light status bar
source $HOME/.config/nvim/rc/which-key.vim             " leader key shortcuts helper
source $HOME/.config/nvim/rc/undotree.vim              " leader key shortcuts helper
Plug 'adelarsq/vim-matchit'                            " match brackets & tags
Plug 'frazrepo/vim-rainbow'                            " brackets individual colouring
Plug 'ryanoasis/vim-devicons'                          " cool icons to plugins
Plug 'vim-scripts/ScrollColors'                        " change themes with SCROLL
Plug 'christoomey/vim-tmux-navigator'                  " switch windows with Ctrl-motion
Plug 'stsewd/fzf-checkout.vim'
Plug 'tommcdo/vim-exchange'
source $HOME/.config/nvim/rc/ale.vim
" ============================

call plug#end()
" }}}

