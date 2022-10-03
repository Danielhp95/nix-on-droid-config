final: prev: {

  # To have all nice tree-sitter grammars
  nvim-treesitter-all = prev.vimPlugins.nvim-treesitter.withPlugins (_: final.tree-sitter.allGrammars);
  nvimbundle = prev.neovimBuilder (import ./vim/neovim-pkg.nix prev);
}
