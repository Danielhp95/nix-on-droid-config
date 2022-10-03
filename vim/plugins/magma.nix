{ pkgs, dsl, ... }:
with dsl;
{

  plugins = with pkgs.vimPlugins; [
    # Dependencies listed on github
    pkgs.python39Packages.pynvim
    pkgs.python39Packages.jupyter-client
    pkgs.ueberzug
    pkgs.python39Packages.latexcodec
    pkgs.python39Packages.plotly
    magma-nvim
  ];

}
