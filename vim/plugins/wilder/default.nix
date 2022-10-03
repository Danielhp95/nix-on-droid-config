# Fancy vim menus for ':', ':', '/', '?'
# allows fuzzy searching terms better
{ pkgs, ... }:
{
  plugins = with pkgs; [
    vimPlugins.wilder-nvim
    vimPlugins.cpsm
    fd
  ];
  lua = builtins.readFile ./wilder.lua;
}
