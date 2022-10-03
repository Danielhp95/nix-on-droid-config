{ pkgs, config, ... }:
{
  # Use the same overlays as the system packages
  # It seems that this usage of overlay will only affect
  # packages installed via home manager, and we don't want that
  # because we want to apply overlays "globally" so nix2vim can use them
  # nixpkgs = { inherit (config.nixpkgs) overlays; };

  imports = [
    ./zsh
    ./starship
    ./tmux
    ./git
    ./fonts.nix
   # ./vim/neovim.nix
  ];

  home.packages = with pkgs; [
      coreutils
      gzip
      gawk
      gnugrep
      exa # Better ls
      bat # Better cat
      delta # Git diff pager
      ranger # File manager
      bottom # like htop but cooler
  ];

  # Read the changelog before changing this value
  home.stateVersion = "22.05";
}
