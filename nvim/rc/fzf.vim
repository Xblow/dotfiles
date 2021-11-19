Plug 'junegunn/fzf.vim'
   " general
   nnoremap <leader>F  :Files<cr>
   nnoremap <leader>ff :Files %:p:h<cr>
   nnoremap <leader>fs :Snippets<cr>
   nnoremap <leader>fh :Helptags<cr>
   nnoremap <leader>H  :History:<cr>
   nnoremap <leader>f/ :History/<cr>
   nnoremap <leader>fw :Windows<cr>
   nnoremap <leader>fm :Maps<cr>
   " coding related
   nnoremap <leader>gf :GFiles<cr>
   nnoremap <leader>ft :Tags<cr>
   nnoremap <leader>b  :Buffers<cr>
   nnoremap <leader>fg :Rg<cr>
   nnoremap <leader>fc :Commands<cr>
   nnoremap <leader>fl :Lines<cr>
   nnoremap <leader>f' :Marks<cr>
   " local buffer constrained search
   nnoremap <leader>fbt :BTags<cr>
   nnoremap <leader>fbl :BLines<cr>
   if has("nvim")
      autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
   endif
   nnoremap <silent> <Leader>f. :Files <C-r>=expand("%:h")<cr>/<cr>

   let g:fzf_commits_log_options = '--graph --color=always'
   let g:fzf_tags_command = 'ctags -R'

   if has('nvim') && !exists('g:fzf_layout')
     autocmd! FileType fzf
     autocmd  FileType fzf set laststatus=0 noshowmode noruler
       \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
   endif

   let g:fzf_layout = {'up':'~90%', 'window': {
                        \ 'width': 0.8, 'height': 0.5,'yoffset':0.5,
                        \ 'xoffset': 0.5,
                        \ 'border': 'rounded' } }
   " let g:fzf_layout = { 'down': '40%' }
   "
   autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

   " command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


