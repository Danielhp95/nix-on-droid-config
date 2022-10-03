{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    tmpclone-nvim
  ];

  use.tmpclone.setup = callWith { };
}
