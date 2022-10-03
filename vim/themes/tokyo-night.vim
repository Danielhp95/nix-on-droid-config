let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
set termguicolors
let g:tokyonight_transparent_background = 1
let g:tokyonight_current_word = 'bold'
let g:tokyonight_style = 'night'
" italic is broken in tmux / xterm-256color
let g:tokyonight_disable_italic_comment = 1
let g:lightline = {'colorscheme' : 'tokyonight'}
colorscheme tokyonight

 let g:fzf_colors =
 \ { 'fg':      ['fg', 'Normal'],
   \ 'bg':      ['bg', 'CursorLine'],
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

" Comments look shite
hi Comment guifg=lightgreen ctermfg=lightgreen
