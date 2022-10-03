# Project management with telescope
# - auto searchs in homedir for git repos
# - move between projects (change working dir)
# - search inside projects
{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = project-nvim;
      type = "lua";
      config = ''
        require('telescope').load_extension('projects')
        require("project_nvim").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      '';
    }
  ];
}
