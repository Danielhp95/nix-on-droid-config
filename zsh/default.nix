{ lib, config, pkgs, ... }:
with lib;
let
  keyBindings = builtins.readFile ./key-bindings.zsh;
  fzf-tab-conf = ''
    zstyle ":completion:*:git-checkout:*" sort false
    zstyle ':completion:*:descriptions' format '[%d]'
    zstyle ':completion:*' list-colors ${"\${(s.:.)LS_COLORS}"}
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
  '';
in
{
  home.packages = with pkgs; [
    nix-zsh-completions

    # rust alternatives
    fd # find alternative
    bat # cat alternative
    exa # ls alternative
    du-dust # du alternative. Pretty crazy
  ];

  programs.fzf.enable = true;
  programs.zsh = {
    enable = true;
    initExtra = keyBindings + fzf-tab-conf + ''
      # ctrl-w, alt-b (etc.) stop at chars like `/:` instead of just space
      autoload -U select-word-style
      select-word-style bash

      # bindkey '^r' fzf-history-widget  # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
      bindkey ' ' magic-space          # [Space] - don't do history expansion


      # Edit the current command line in $EDITOR
      autoload -U edit-command-line
      zle -N edit-command-line
      bindkey '\C-e\C-e' edit-command-line
    '';
    autocd = true;
    dotDir = ".config/zsh";
    defaultKeymap = "emacs"; # this is the default, don't get scared
    enableAutosuggestions = true;
    enableCompletion = true;
    envExtra = ''
      EDITOR=vim
      TERM=xterm-256color
    '';
    history = {
      ignoreDups = true;
      extended = true;
      save = 1000000;
      size = 1000000;
      share = true;
    };
    # TODO: integrate better (this silently ignores if config.themes.extraShellAliases is not set)
    shellAliases = {
      # other
      fport = "ss -tlpn | grep";

      skk = ''export SSH_AUTH_SOCK=$(nu -c "ls /tmp | where name =~ ssh- | sort-by modified -r | get name | get 0")'';

      # git
      wow = "git status";

      # exa
      l = "exa";
      ls = "exa -lahFg";
      ll = "exa -lFhg";
      la = "exa -alFg";

      # rust alternatives
      du = "dust";

      # tmux
      t = "tmux a";
      # TODO: Check if this prints the last branch from which the current branch forked
      git-parent = "git log --pretty=format:'%D' HEAD^ | grep 'origin/' | head -n1 | sed 's@origin/@@' | sed 's@,.*@@'";
    };
    plugins = [
      { name = "nix-zsh-completions"; src = pkgs.nix-zsh-completions; }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "190500bf1de6a89416e2a74470d3b5cceab102ba";
          sha256 = "sha256-C6cE96YXyYP1RxpCLVtG1hcYLluplPLiIdkdo4HXN7Y=";
        };
        file = "fzf-tab.plugin.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "caa749d030d22168445c4cb97befd406d2828db0";
          sha256 = "sha256-YV9lpJ0X2vN9uIdroDWEize+cp9HoKegS3sZiSpNk50=";
        };
      }
    ];
  };
}
