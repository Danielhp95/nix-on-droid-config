# Pretty Symbols for ASTs
{ pkgs, ... }:
{
  plugins = with pkgs.vimPlugins; [
    lspkind-nvim # symbols for classes,funcs etc.
  ];
  lua = builtins.readFile ./lspkind.lua;
}
