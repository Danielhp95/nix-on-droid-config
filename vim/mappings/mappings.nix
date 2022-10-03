{ dsl, pkgs, ... }:
with dsl;
let
  cmd = command: desc: [ "<cmd>${command}<cr>" desc ];
in
{
  plugins = with pkgs.vimPlugins; [
    which-key-nvim
  ];

  # When we get things working, remove to see if this is still necessary
  # Why do marks and registers not work?
  setup.which-key = callWith { };
  lua = builtins.readFile ./mappings.lua;
}
