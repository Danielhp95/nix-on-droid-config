# Git in vim plugin from tpope
{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    vim-fugitive
    gitsigns-nvim
  ];

  use.gitsigns.setup = callWith {};
}
