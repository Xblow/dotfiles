Plug 'dense-analysis/ale'

  let g:ale_enabled = 0
  let g:ale_sign_error = '●'
  let g:ale_sign_warning = '.'
  highlight clear ALEErrorSign
  highlight clear ALEWarningSign

  " nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  " nmap <silent> <C-j> <Plug>(ale_next_wrap)
  nnoremap <leader>hg :ALEToggle<cr>
