# Syntax highlighting for most languages using ASTs
{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    pkgs.nvim-treesitter-all
    playground # playground for treesitter
  ];
  lua = builtins.readFile ./treesitter.lua;
}
