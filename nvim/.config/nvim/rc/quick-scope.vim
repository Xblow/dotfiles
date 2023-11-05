Plug 'unblevable/quick-scope'       " Highlight letters for easier jumping
      let g:qs_max_chars=120
      let g:qs_enable=0
      " nnoremap <expr> <leader>hq (<Plug>(QuickScopeToggle))."\n"
      nmap <leader>hq <Plug>(QuickScopeToggle)
      augroup qs_colors
        autocmd!
        autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
      augroup END

