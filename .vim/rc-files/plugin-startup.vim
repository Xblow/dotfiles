" All plugins for vim at startup

call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'                     " git support
     nnoremap <leader>gA :Git add %<cr>
     nnoremap <leader>gR :Git reset %<cr>
     nnoremap <leader>gS :Git<cr>
     nnoremap <leader>gl :Glog<cr>
     nnoremap <leader>gc :Git commit<cr>
     nnoremap <leader>gd :Gdiff<cr>
     nnoremap <leader>gB :Git branch -a<cr>
     nnoremap <leader>gh :Commits<cr>
     nnoremap <leader>gbh :BCommits<cr>

Plug 'junegunn/fzf.vim'                       " General fzf support
     " general
     nnoremap <leader>F  :Files<cr>
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

Plug 'tpope/vim-dispatch'                     " Asynchronous Make procedure
     nnoremap <leader>M :Make<cr>
     nnoremap <leader>mc :Make clean<cr>
     nnoremap <leader>mt :Make tests<cr>

Plug 'lervag/vimtex'			" Tex engine for vim
     let g:vimtex_view_general_viewer = 'zathura'
     let g:tex_flavor = 'latex'

Plug 'dylanaraps/fff.vim'
     map <C-n> :F<cr>
     let g:fff#split = "30vnew"
     let g:fff#split_direction = "nosplitbelow nosplitright"

Plug 'SirVer/ultisnips'    "Snippets engine
     let g:UltiSnipsExpandTrigger = "<tab>"
     let g:UltiSnipsJumpForwardTrigger = '<tab>'
     let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
     let g:UltiSnipsSnippetDirectories=["UltiSnips"]
     let g:UltiSnipsEditSplit="tabdo"
     "--- For editting snippets
     nmap <leader>ue :UltiSnipsEdit<cr>
     nmap <leader>ur :call UltiSnips#RefreshSnippets()<cr>

Plug 'honza/vim-snippets'                     " Collection of snippets

Plug 'tpope/vim-unimpaired'                   " ?

Plug 'tpope/vim-repeat'                       " dot-command to repeat any action

Plug 'tomtom/tcomment_vim'                    " comment shortcuts NOTE: change to <leader>/
    " unmap gcc
    " nnoremap <leader>/ :Tcomment_gc<cr>
" Plug 'tpope/vim-commentary'                   " comment shortcuts

Plug 'machakann/vim-sandwich'                 " Shortcuts to manipulating surrounding environment (analog to surround.vim)
"
" Plug 'alvan/vim-closetag'                   " In case I ever write anything in html

" Plug 'metakirby5/codi.vim'                  " interactive scratchpad (requires cling for c++)

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

Plug 'chrisbra/Colorizer'                           " hightlight hex colors
     let g:colorizer_auto_filetype='css,html,md,config'
     let g:colorizer_disable_bufleave = 1
     nnoremap <silent> <leader>hc :ColorToggle<cr>
     " test: #010232

Plug 'easymotion/vim-easymotion'                    " facilitate cursor jumps
     let g:EasyMotion_do_mapping = 0
     let g:EasyMotion_smartcase = 1
     nmap <Leader>s <Plug>(easymotion-s2)
     nnoremap <Leader>; <Plug>(easymotion-next)
     nnoremap <Leader>, <Plug>(easymotion-prev)
" Plug 'justinmk/vim-sneak'
" " Change the colors
    " highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
    " highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
    " let g:sneak#prompt = '🔎 '
    " let g:sneak#use_ic_scs = 1

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

"      let g:sneak#label = 1
"      " autocmd User SneakLeave highlight clear Sneak
"      highlight SneakScope ctermfg=red ctermbg=yellow
"      highlight Sneak ctermfg=white ctermbg=black
     " autocmd User SneakLeave highlight clear Sneak
     " highlight link Sneak None
     " highlight link Sneak None

" Plug 'haya14busa/incsearch.vim'         " supposedly, a better incsearch

Plug 'vim-scripts/ScrollColors'           " change themes quickly with SCROLL command

" Plug 'flazz/vim-colorschemes'           " 1000 colorschemes for vim
    " colorscheme revolutions
" Plug 'joshdick/onedark.vim'             " Particular theme

" Plug 'vim-airline/vim-airline'            " Status bar (loading time 50ms)
"     set noshowmode
"     let g:airline_extensions = []
"     " let g:airline#extensions#tabline#enabled = 1
" "
" Plug 'vim-airline/vim-airline-themes'
"     let g:airline_theme='deus'
" " other nice themes: transparent
"
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

" let g:plug_timeout = 300 " Increase vim-plug timeout for YouCompleteMe.
" Plug 'Valloric/YouCompleteMe'        " autocompletion very fat (130 ms)
" , { 'do': './install.py' }
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }    " show help when pressing leader key
      nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<cr>
      " highlight  ctermbg=brown guibg=brown

" Plug 'mhinz/vim-startify'

Plug 'adelarsq/vim-matchit'           " Match brackets & tags

Plug 'frazrepo/vim-rainbow'           " Individual coloring for nested brackets

Plug 'ryanoasis/vim-devicons'         " Cool icons to plugins

" Plug 'simnalamburt/vim-mundo'
     " nnoremap <silent> <leader>ut :MundoToggle<cr> <bar> :call ToggleHighlightWhitespace()<cr>

Plug 'mbbill/undotree'
  nnoremap <silent> <leader>ut :UndotreeToggle<cr>
  if has("persistent_undo")
    set undofile
    set undodir=$HOME/.cache/vim/undo
  endif


" Plug 'majutsushi/tagbar'            " To test out: bar with functions/classes (works off ctags)

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

