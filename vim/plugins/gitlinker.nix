# Adapater for alternative git forges
# Similar to :GBrowse from fugitive but supports more forges
{ pkgs, dsl, ... }:
with dsl;
let
  cmd = command: desc: [ "<cmd>${command}<cr>" desc ];
in
{
  plugins = with pkgs.vimPlugins; [
    gitlinker-nvim
  ];
  # add in terminal mapping to close Term
  #tnoremap."<C-Space>" = "<C-\\\\><C-n> :ToggleTerm<cr>";
  #_internal.which-key.run = {
  #  "['<C-Space>']" = cmd "ToggleTerm" "Toggle Term";
  #};
  use.gitlinker.setup = callWith {
    callbacks = rawLua ''{
      ["gitea.home.local"] = require"gitlinker.hosts".get_gitea_type_url,
    }'';
  };
}
