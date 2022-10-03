{ pkgs, dsl, ... }:
let
  config = builtins.readFile ./trouble.lua;
in
{
  plugins = with pkgs.vimPlugins; [
    trouble-nvim
  ];
  lua = builtins.readFile ./trouble.lua;
}
