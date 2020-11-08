Plug 'mhinz/vim-signify'                      " git plugin
     let g:signify_sign_add               = '+'
     let g:signify_sign_delete            = '-'
     let g:signify_sign_delete_first_line = '‾'
     let g:signify_sign_change            = '~'

     highlight link SignifyLineChange          DiffChange
     highlight link SignifyLineDelete          DiffDelete
     highlight link SignifyLineDeleteFirstLine SignifyLineDelete
     highlight link SignifySignAdd             DiffAdd
     highlight link SignifySignChange          DiffChange
     highlight link SignifySignDelete          DiffDelete
     highlight link SignifySignDeleteFirstLine SignifySignDelete
     highlight link SignifyLineChange          DiffText

     let g:signify_sign_show_text = 1
     augroup signifyHighlight
       au ColorScheme,VimEnter * highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
       au ColorScheme,VimEnter * highlight SignifySignAdd    ctermfg=green  ctermbg=NONE
       au ColorScheme,VimEnter * highlight SignifySignDelete ctermfg=red  ctermbg=NONE
       au ColorScheme,VimEnter * highlight SignifySignChange ctermfg=yellow  ctermbg=NONE
     augroup END

