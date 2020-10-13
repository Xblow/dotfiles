let g:vimtex_imaps_leader='#'

set conceallevel=1
let g:tex_conceal = "abdgm"
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'okular'
"
"===== Spell checking ====
setlocal spell			" switch on spell checking
hi clear SpellBad
hi SpellBad cterm=underline
" set spelllang=en_gb  "--- Fix the problem with cyan hi
  " fixing last spelling error 
imap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

  "--- for inkscape invocation
" inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR> 
" nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
