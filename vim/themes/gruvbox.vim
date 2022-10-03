" Plugin Specific

" koehler
" hi Visual  guifg=#282828 guibg=#fe8019 gui=none " simple orange visual
" highlight SignColumn guibg=black
" highlight SignColumn ctermbg=black
" highlight GitGutterAdd    guifg=#009900 guibg=black ctermfg=2 ctermbg=black
" highlight GitGutterChange guifg=#bbbb00 guibg=black ctermfg=3 ctermbg=black
" highlight GitGutterDelete guifg=#ff2222 guibg=black ctermfg=1 ctermbg=black


" lightline
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left':  [[ 'mode', 'paste' ], ['fugitive'], ['filename']],
    \   'right': [['lineinfo'], ['percent'], ['filetype'], ['cocstatus']]
    \ },
    \ 'component_function': {
    \   'fugitive': 'FugitiveHead',
    \   'cocstatus': 'StatusDiagnostic',
    \ },
    \ 'tabline': {
    \   'left': [['tabs']],
    \   'right': [['\']]
    \ } }

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 colorscheme gruvbox
" gruvbox
let g:gruvbox_termcolors=256
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
highlight GitGutterAdd    guifg=#009900 guibg=bg ctermfg=2 ctermbg=bg
highlight GitGutterChange guifg=#bbbb00 guibg=bg ctermfg=3 ctermbg=bg
highlight GitGutterDelete guifg=#ff2222 guibg=bg ctermfg=1 ctermbg=bg
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

