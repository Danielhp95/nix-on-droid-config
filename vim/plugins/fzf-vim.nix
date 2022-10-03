# FZF in vim, fuzzy search many things fast
{ pkgs, dsl, ... }:
let
  cmd = command: desc: [ "<cmd>${command}<cr>" desc ];
in
with dsl; {
  plugins = [ pkgs.vimPlugins.fzf-vim ];
  vim.g = {
    # 'bg' changed from Normal to ErrorMsg so not overrode by transparent conf
    fzf_colors = ''
      \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'ErrorMsg'],
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
    '';
    # allows cycling back through history (ctrl-p)
    fzf_history_dir = "'~/.local/share/fzf-history'";
  };
  # NOTE: breaks telescope + other plugins C-J
  #cnoremap = {
  #  # remap up/down in fzf window
  #  "<c-k>" = "<c-p>";
  #  "<c-j>" = "<c-n>";
  #};
  imap."<c-f>" = "<plug>(fzf-complete-path)";
  nmap."<leader><tab>" = "<plug>(fzf-maps-n)";
  xmap."<leader><tab>" = "<plug>(fzf-maps-x)";
  omap."<leader><tab>" = "<plug>(fzf-maps-o)";
  _internal.which-key.fzf = {
    "['<leader>']" = {
      F = {
        name = "+find (fzf)";
        a = cmd "Commits" "Open commit log in FZF";
        f = cmd "Files" "Files in dir";
        b = cmd "Buffers" "Switch to open buffers";
        c = cmd "GCheckout" "Search checked-out branches";
        C = cmd "BCommits" "Open this branch's commits in FZF";
        h = cmd "History" "Search command history";
        g = cmd "Rg" "Search files in dir";
        "['~']" = cmd "Files ~" "Files in home";
        "['/']" = cmd "Files /" "Files in root";
        "['?']" = cmd "Lines" "Search in open buffers";
        m = cmd "Maps" "Search keymaps";
      };
    };
  };
  vimscript = ''
    set rtp+=${pkgs.fzf}/bin/fzf

    " f -> find (fzf)
    inoremap <expr> <plug>(fzf-complete-path) fzf#vim#complete#path("fd . --color=never")
    inoremap <expr> <plug>(fzf-complete-file)  fzf#vim#complete#path("fd --type f . --color=never")

    " fzf git checkout via GCheckout
    function! s:open_branch_fzf(line)
      let l:parser = split(a:line)
      let l:branch = l:parser[0]
      if l:branch ==? '*'
        let l:branch = l:parser[1]
      endif
      execute '!git checkout ' . l:branch
    endfunction

    command! -bang -nargs=0 GCheckout
      \ call fzf#vim#grep(
      \   'git branch -v', 0,
      \   {
      \     'sink': function('s:open_branch_fzf')
      \   },
      \   <bang>0
      \ )
  '';
}
