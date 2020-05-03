set encoding=utf-8
set nocompatible		" vi non-compatible
set scrolloff=1
set ai				" autoindent
set mouse=n   " scroll text not cursor

set number
set ruler
set showcmd
set autoread

set hlsearch
set incsearch
set showmatch

set ignorecase
set smartcase			" will not ignore case if there is an upper case letter

" set backspace=indent,eol,start  "make backspace key work the way it should
"
set t_Co=256                            "Support 256 colors
colorscheme elflord

function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
  setlocal shiftwidth=2
  setlocal tabstop=4
endfunction
au FileType c,cpp call GnuIndent()

filetype on
filetype indent on
set tabstop=2  			" show existing tab with 4 spaces width
set shiftwidth=2		" when indenting with '>', use 4 spaces width
set expandtab 			" On pressing tab, insert 4 spaces
set textwidth=80
set clipboard=unnamedplus

highlight Search ctermfg=white
highlight Search ctermbg=red
"
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

"--- Switching syntax off for large files
syntax on
autocmd BufWinEnter * if line2byte(line("$") + 1) > 500000 | syntax clear | endif

set wildmode=longest,list
set history=200
" cnoremap <C-p> <Up>
" cnoremap <C-n> <Down>

"--- Transversing vim buffer list
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"--- Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=brown guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * call clearmatches()
autocmd BufWinLeave * call clearmatches()

"--- Remove trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

set foldmethod=manual

"--- Easier split screen transformation (not working)
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>    :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>

"--- Easy movement across splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"--- Make cursor stay while rolling page
nnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k

nmap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"

set backupdir=~/.vim/tmp,.

" let mapleander = "\<Space>"
" map <SPACE> <leader>
" Force to use underline for spell check results
" (instead of marking the whole thing BRIGHT RED)
" augroup SpellUnderline
"   autocmd!
"   autocmd ColorScheme *
"     \ highlight SpellBad
"     \   cterm=Underline
"     \   ctermfg=red
"     \   ctermbg=NONE
"     \   term=undercurl
"     \   gui=Undercurl
"     \   guisp=Red
"   autocmd ColorScheme *
"     \ highlight SpellCap
"     \   cterm=Underline
"     \   ctermfg=magenta
"     \   ctermbg=NONE
"     \   term=Reverse
"     \   gui=Undercurl
"     \   guisp=Red
"   autocmd ColorScheme *
"     \ highlight SpellLocal
"     \   cterm=Underline
"     \   ctermfg=red
"     \   ctermbg=NONE
"     \   term=Reverse
"     \   gui=Undercurl
"     \   guisp=Red
"   autocmd ColorScheme *
"     \ highlight SpellRare
"     \   cterm=Underline
"     \   ctermfg=NONE
"     \   ctermbg=NONE
"     \   term=Reverse
"     \   gui=Undercurl
"     \   guisp=Red
" augroup END
" Ctrl+L corrects last spelling error:
" imap <C-l> <Esc>ml[s1z=`la


"==============================================================================
"        Plugins
"==============================================================================
" Setup directories and vim-plug {{{

if !filereadable($HOME . '/.vim/autoload/plug.vim')
    silent !mkdir -p ~/.vim/autoload >/dev/null 2>&1
    silent !mkdir -p ~/.vim/plugged >/dev/null 2>&1
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                \ >/dev/null 2>&1
    autocmd VimEnter * PlugInstall
endif

" }}}
" Plugin manager
call plug#begin('~/.vim/plugged')
  Plug 'arcticicestudio/nord-vim'                          " Nord theme
  Plug 'vim-airline/vim-airline'                         " Status bar
    let g:airline_powerline_fonts = 1
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-unimpaired'                              " Shortcuts from tpope
  Plug 'tpope/vim-surround'                                " Shortcuts from tpope
  Plug 'lervag/vimtex'
    let g:tex_flavor  = "latex"
  Plug 'KeitaNakamura/tex-conceal.vim'
  Plug 'SirVer/ultisnips'    "Snippets engine
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories=["UltiSnips"]
    let g:UltiSnipsEditSplit="vertical"
    "--- For editting snippets
    nmap <leader>te :UltiSnipsEdit<cr>
    nmap <leader>tr :call UltiSnips#RefreshSnippets()<cr>
  Plug 'tpope/vim-fugitive'
  Plug 'chiel92/vim-autoformat'
    "--- For allow project settings
    let g:formatters_cpp = ['custom_astyle_cpp']
    let g:formatdef_custom_astyle_cpp = '"astyle --project"'
    nnoremap <leader>pf :Autoformat<CR>
  Plug 'preservim/nerdtree'
    nnoremap <C-n> :NERDTreeToggle<CR>
  Plug 'tpope/vim-dispatch'                     " Asynchronous Make procedure
  Plug 'chrisbra/colorizer'                     " Render hex colors
  "--- Figure out how to use
  Plug 'mhinz/vim-grepper'                      " Universal async too for grep operations
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    nnoremap <C-p> :<C-u>FZF<CR>
    nnoremap <leader>s :<C-u>FZF<CR>
  " Plug 'airblade/vim-gitgutter'
  "  set updatetime=100
  Plug 'mhinz/vim-signify'
    let g:signify_sign_add               = '+'
    let g:signify_sign_delete            = '-'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change            = '~'
    highlight link SignifyLineAdd             DiffAdd
    highlight link SignifyLineChange          DiffChange
    highlight link SignifyLineDelete          DiffDelete
    highlight link SignifyLineDeleteFirstLine SignifyLineDelete
    highlight link SignifySignAdd             DiffAdd
    highlight link SignifySignChange          DiffChange
    highlight link SignifySignDelete          DiffDelete
    highlight link SignifySignDeleteFirstLine SignifySignDelete

    let g:signify_sign_show_text = 1
    highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
    highlight SignifySignAdd    ctermfg=green  ctermbg=NONE
    highlight SignifySignDelete ctermfg=red  ctermbg=NONE
    highlight SignifySignChange ctermfg=yellow  ctermbg=NONE
    highlight link SignifyLineChange DiffText

    " let g:signify_line_highlight = 0
  " Plug 'dense-analysis/ale' " linter
  "   nmap <silent> [W <Plug>(ale_first)
  "   nmap <silent> [w <Plug>(ale_previous)
  "   nmap <silent> ]w <Plug>(ale_next)
  "   nmap <silent> ]W <Plug>(ale_last)
  "
  " Setting the g:ale_linters variable this way means t

  " let g:colorizer_auto_color = 1
    " let g:ConqueTerm_StartMessages = 0


  "--- Unused plugins
  " Plug 'honza/vim-snippets'  "--- Snippets repo: keep for examples
  " Plug 'chrisbra/vim-commentary'  " Comments plugin


call plug#end()

