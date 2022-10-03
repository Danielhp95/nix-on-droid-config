# Toggle NVIM terminal nicely with good UX
{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    toggleterm-nvim
  ];
  use.toggleterm.setup = callWith {
    direction = "float";
    shade_terminals = true;
    shading_factor = 2;
    start_in_insert = true;
    persist_size = true;
    persist_mode = true;
    float_opts = {
      border = "single";
      winblend = 3;
    };
  };
}
