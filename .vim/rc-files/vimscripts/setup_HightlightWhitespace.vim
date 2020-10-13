" Little script for highlighting whitespace

let g:toggleHighlightWhitespace = 1

function! ToggleHighlightWhitespace()
  let g:toggleHighlightWhitespace = 1 - g:toggleHighlightWhitespace
  call RefreshHighlightWhitespace()
endfunction

function! RefreshHighlightWhitespace()
  if g:toggleHighlightWhitespace == 1 " normal action, do the hi
    highlight ExtraWhitespace ctermbg=brown guibg=brown
    match ExtraWhitespace /\s\+$/
    augroup HighLightWhitespace
      autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
      autocmd InsertLeave * match ExtraWhitespace /\s\+$/
      autocmd InsertEnter * call clearmatches()
      autocmd BufWinLeave * call clearmatches()
    augroup END
  else " clear whitespace highlighting
    call clearmatches()
    autocmd! HighLightWhitespace BufWinEnter
    autocmd! HighLightWhitespace InsertEnter
    autocmd! HighLightWhitespace InsertLeave
    autocmd! HighLightWhitespace BufWinLeave
  endif
endfunction

autocmd BufWinEnter * call RefreshHighlightWhitespace()
autocmd BufWinLeave * call RefreshHighlightWhitespace()

