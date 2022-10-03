{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    telescope-project-nvim
  ];
  lua = ''
    require('telescope').setup {
      extensions = {
        project = {
          base_dirs = {
            '~/Projects',
            '~/playground',
            '~/',
          },
          -- theme = "dropdown"
        }
      }
    }
    require'telescope'.load_extension('project')
    -- require'telescope'.extensions.project.project{ display_type = 'full' }
  '';
}
