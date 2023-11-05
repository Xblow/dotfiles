Plug 'SirVer/ultisnips'    "Snippets engine
     let g:UltiSnipsExpandTrigger = "<tab>"
     let g:UltiSnipsJumpForwardTrigger = '<tab>'
     let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
     let g:UltiSnipsSnippetDirectories=["UltiSnips"]
     let g:UltiSnipsEditSplit="tabdo"
     "--- For editting snippets
     nmap <leader>ue :UltiSnipsEdit<cr>
     nmap <leader>eu :UltiSnipsEdit<cr>
     nmap <leader>ur :call UltiSnips#RefreshSnippets()<cr>

 Plug 'honza/vim-snippets'                     " Collection of snippets

