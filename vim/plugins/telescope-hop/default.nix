{ pkgs, ... }:
{
  plugins = with pkgs.vimPlugins; [
    nvim-telescope-hop
  ];
  lua = builtins.readFile ./hop.lua;
}
