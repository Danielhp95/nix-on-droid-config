# Wrapper Plugin around many file managers such as Xplr, Ranger and Broot
{ pkgs, dsl, ... }:
with dsl;
let
  cmd = command: desc: [ "<cmd>${command}<cr>" desc ];
in
{
  plugins = with pkgs.vimPlugins; [
    fm-nvim
  ];
  lua = ''
    function FmDir(cmd)
      parent = getCurrDir()
      vim.cmd (string.format(":%s %s", cmd, parent))
    end
  '';
  _internal.which-key.fm = {
    "['<leader>']" = {
      "['-']" = cmd "lua FmDir('Ranger')" "Ranger open in current dir";
      "['_']" = cmd "Ranger ~" "Ranger open in home dir";
      a = {
        b = cmd "lua FmDir('Broot')" "Broot open in curr dir";
        B = cmd "Broot ~" "Broot open in home dir";
        d = cmd "lua FmDir('Xplr')" "Xplr open in curr dir";
        D = cmd "Xplr ~" "Xplr open in home dir";
      };
    };
  };
  use.fm-nvim.setup = callWith {
    edit_cmd = "edit";
    ui = {
      default = "float";
      float = {
        # Floating window border (see ':h nvim_open_win')
        border = "rounded";

        # Highlight group for floating window/border (see ':h winhl')
        float_hl = "Normal";
        border_hl = "FloatBorder";

        # Floating Window Transparency (see ':h winblend')
        blend = 0;

        # Num from 0 - 1 for measurements
        height = 0.9;
        width = 0.9;

        # X and Y Axis of Window
        x = 0.5;
        y = 0.5;
      };
    };

    cmds = {
      broot = "${pkgs.broot}/bin/broot --out /tmp/fm-nvim";
      ranger = "${pkgs.ranger}/bin/ranger";
      xplr = "${pkgs.xplr}/bin/xplr";
    };

    # Mappings used with the plugin
    mappings = {
      vert_split = "<C-v>";
      horz_split = "<C-h>";
      tabedit = "<C-t>";
      edit = "<C-e>";
      ESC = ":q<CR>";
    };

    broot_conf = "~/.config/broot/conf.hjson";
  };
}
