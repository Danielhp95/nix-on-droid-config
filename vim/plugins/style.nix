# Themes + Status Line (lualine atm)
{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    lualine-nvim
    tabline-nvim

    # Colorschemes
    dracula-vim
    tokyonight-nvim
    nightfox-nvim
    onedark-nvim
    #zephyr-nvim

    nvim-web-devicons
    markdown-preview-nvim
  ];

  # TODO: if you find the motivation.
  #Copy style from: https://github.com/olimorris/onedarkpro.nvim
  # Which should be in the author's dotfiles: https://github.com/olimorris/dotfiles/

  use.onedark.setup = callWith {
    style = "deep";
    toggle_style_key = "<C-c>";
  };

  vimscript = "colorscheme onedark";

  # use.onedark.load = callWith { };

  setup.lualine = {
    options = {
      icons_enabled = true;
      theme = "auto";
      component_separators = { left = ""; right = ""; };
      section_separators = { left = ""; right = ""; };
      globalstatus = false;
    };
    sections = {
      lualine_a = [ "%{&spell ? 'SPELL' : ':3'}" "mode" ];
      lualine_b = [ "branch" "diff" "diagnostics" ];
      lualine_c = [ "filename" ];
      lualine_x = [ "filetype" ];
      lualine_y = [ "progress" ];
      lualine_z = [ "location" ];
    };
    inactive_sections = {
      lualine_a = [ ];
      lualine_b = [ "filetype" ];
      lualine_c = [ "filename" ];
      lualine_x = [ "location" ];
      lualine_y = [ ];
      lualine_z = [ ];
    };
    tabline = { };
    extensions = [ ];
  };
  # TODO: tabline
}
