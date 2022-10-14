Plug 'derekwyatt/vim-fswitch'
    " found out about it here: https://idie.ru/posts/vim-modern-cpp/
    au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
    au BufEnter *.cc let b:fswitchdst = "h,hpp"

    nnoremap <silent> <A-o> :FSHere<cr>
    nnoremap <silent> <Leader>ol :FSRight<cr>
    nnoremap <silent> <Leader>oL :FSSplitRight<cr>
    nnoremap <silent> <Leader>oh :FSLeft<cr>
    nnoremap <silent> <Leader>oH :FSSplitLeft<cr>
    nnoremap <silent> <Leader>ok :FSAbove<cr>
    nnoremap <silent> <Leader>oK :FSSplitAbove<cr>
    nnoremap <silent> <Leader>oj :FSBelow<cr>
    nnoremap <silent> <Leader>oJ :FSSplitBelow<cr>

