" All keybindings in here

"--- Transversing vim buffer list
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"--- Remove trailing whitespace
" if (defined(g:toggleHighlightWhitespace))
" endif

"--- Make cursor stay while rolling page
nnoremap <C-e> <C-e>j
vnoremap <C-e> <C-e>j
nnoremap <C-y> <C-y>k
vnoremap <C-y> <C-y>k

"--- Make search behaviour 'very magic' (like regex)
nnoremap / /\V
nnoremap ? ?\V

nmap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"

"--- Highlighting bindings
source $HOME/.vim/rc-files/vimscripts/setup_HightlightWhitespace.vim

nnoremap <silent><expr> <leader>hh (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
nnoremap <expr> <leader>hl (&spell ? ':set nospell' : ':set spell')."\n"
nnoremap <expr> <leader>hr (&relativenumber ? ':set norelativenumber' : ':set relativenumber')."\n"
nnoremap <silent> <leader>hs :call ToggleHighlightWhitespace()<cr>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"--- Close buffer with window untouched
command! Bd :bp | :sp | :bn | :bd

" Switch between windows using alt
if has('nvim')
    tnoremap <C-[> <C-\><C-n>
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
endif
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Open terminal in nvim
if has('nvim')
    nnoremap <leader>tb  :terminal<cr>
    nnoremap <leader>ts  :split term://bash<cr>
    nnoremap <leader>tvb :vsplit term://bash<cr>
    nnoremap <leader>tvp :vsplit term://python<cr>
    nnoremap <leader>teb :edit term://bash<cr>
    nnoremap <leader>tep :edit term://python<cr>
endif

