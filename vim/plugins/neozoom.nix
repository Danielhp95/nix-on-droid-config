{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    neozoom-nvim
  ];
  use.neo-zoom.setup = callWith {
    width_ratio = 0.9;
    left_ratio = 0.035;
    border = "single";
  };
}
