{ ... }:
let
  # TODO: link up themes to user global themes
  themes = {
    gruvbox = {
      username = "[$user]($style)";
      hostname = "[@$hostname](bold bright-red) [|](bold bright-green) ";
      directory = "[$path]($style)[$read_only]($read_only_style) ";
    };
    tokyo-night = {
      username = "[$user](bold red)";
      hostname = "[@](bold yellow)[$hostname](bold bright-cyan) [|](bold bright-green) ";
      directory = "[$path](bold bright-cyan)[$read_only](bold bright-red) ";
    };
  };
  theme = themes.tokyo-night;
in
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$all";
      username = {
        show_always = true;
        format = theme.username;
      };
      hostname = {
        ssh_only = false;
        format = theme.hostname;
      };
      directory = {
        format = theme.directory;
      };
    };
  };
}
