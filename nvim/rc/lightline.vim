Plug 'itchyny/lightline.vim'              " analogous to airline
     set noshowmode
     let g:lightline = {
          \ 'colorscheme': "powerlineish",
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'FugitiveHead'
          \ },
          \ }
     set laststatus=2                     " bug with jumping from fff
     " nice themes: deus wombat, jellybeans

