# Completion engine for neovim
{ pkgs, dsl, ... }:
with dsl; {
  plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    lsp_signature-nvim
    lspkind-nvim
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp_luasnip
    cmp-dap
  ];

  # TODO: not working?
  setup.lsp_signature = {
    bind = true;
    hint_enable = false;
    hi_parameter = "Visual";
    handler_opts.border = "single";
  };

  lua = builtins.readFile ./cmp.lua;

}
