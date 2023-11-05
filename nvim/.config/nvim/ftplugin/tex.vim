" Edit this file
nnoremap <leader>ef :tabe $HOME/.config/nvim/ftplugin/tex.vim<CR>
nnoremap <leader>em :tabe $HOME/.config/nvim/UltiSnips/texmath.snippets<CR>

" write greek letters with this trigger
let g:vimtex_imaps_leader='#'

" Conceal
" set conceallevel=2
nnoremap <expr> <leader>hf (&conceallevel>0 ? ':set conceallevel=0' : ':set conceallevel=2')."\n"
" set concealcursor=""
let g:tex_conceal="abdmgs"
highlight Conceal ctermbg=NONE guibg=NONE

" set conceallevel=1
" let g:tex_conceal = "abdgm"
let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_general_viewer = 'okular'
"
"===== Spell checking ====
setlocal spell spelllang=en_gb " switch on spell checking
set nospell
hi clear SpellBad
hi SpellBad cterm=underline
" set spelllang=en_gb  "--- Fix the problem with cyan hi
  " fixing last spelling error
imap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" To cycle through all labels
set iskeyword+=:

nnoremap <C-p> :VimtexTocToggle<cr>
" nnoremap <C-l> :VimtexLabelsToggle<cr>
" let g:Tex_IgnoredWarnings

highlight ColorColumn ctermbg=grey guibg=grey
" set textwidth=80
set fdm=marker fmr=<<<,>>>

" Never Forget, To set the default viewer:: Very Important
let g:Tex_ViewRule_pdf = 'zathura'

" Trying to add same for pdfs, hoping that package SynTex is installed
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'

  "--- for inkscape invocation
" inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
" nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
