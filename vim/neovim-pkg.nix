{ pkgs, ... }:
{
  imports = [
    ./options.nix
   #./mappings/mappings.nix
   #./plugins/essentials.nix
   #./plugins/bufferline.nix
   #./plugins/style.nix
   #./plugins/telescope
   #./plugins/cmp
   #./plugins/treesitter
   #./plugins/lspkind
   #./plugins/wilder
   #./plugins/fugitive.nix
   #./plugins/trouble
   #./plugins/dap
   #./plugins/nvim-tree.nix
   #./plugins/lsp.nix

    #./plugins/telescope-project
    #./plugins/toggleterm.nix
    #./plugins/neozoom.nix

    #./plugins/playground.nix
    #./plugins/tmpclone.nix
    #./plugins/imagine.nix
  ];
  withPython3 = true;
  withNodeJs = true;
}
