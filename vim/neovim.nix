args@{ lib, pkgs, ... }:
{
  home.packages = [
    pkgs.gcc pkgs.gnumake  # Required for telescope-fzf-native. Ideally we will find away of defining these elsewhere

    (pkgs.neovimBuilder (import ./neovim-pkg.nix args))
  ];
}
