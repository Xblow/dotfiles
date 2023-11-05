Plug 'lervag/vimtex'			" Tex engine for vim
     let g:vimtex_view_general_viewer = 'zathura'
     let g:vimtex_view_method = 'zathura'
     let g:tex_flavor = 'latex'
     let g:vimtex_compiler_latexmk = {
         \ 'build_dir' : '',
         \ 'callback' : 1,
         \ 'continuous' : 1,
         \ 'executable' : 'latexmk',
         \ 'hooks' : [],
         \ 'options' : [
         \   '-pdflatex',
         \   '-verbose',
         \   '-file-line-error',
         \   '-synctex=1',
         \   '-interaction=nonstopmode',
         \ ],
         \}

     " Disable overfull/underfull \hbox warnings
     let g:vimtex_quickfix_ignore_filters = [
               \ 'contains only floats',
               \ 'Overfull \\hbox',
               \]

     " let g:vimtex_quickfix_ignore_filters = {
     "           \ 'overfull' : 0,
     "           \ 'underfull' : 0,
     "           \ 'font' : 0,
     "           \ 'contains only floats': 0,
     "           \ 'Overfull \\hbox': 0,
     "           \}

