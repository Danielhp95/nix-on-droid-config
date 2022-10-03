{pkgs, dsl, ...}:
with dsl;
{

  plugins = with pkgs.vimPlugins; [
    hologram-nvim 
    nvim-lightbulb
    nvim-code-action-menu
  ];

  use.hologram.setup = callWith {
    auto_display = true;  # WIP automatic markdown image display, may be prone to breaking
  };

  lua = "require('nvim-lightbulb').setup({autocmd = {enabled = true}})";

}
