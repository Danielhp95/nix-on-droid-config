# LSP + Language specific configurations
{ pkgs, dsl, ... }:
with dsl; {
  plugins = with pkgs.vimPlugins; [
    null-ls-nvim # configurable LSP for unsupported languages
    nvim-lspconfig # collection of LSP config files
    lspsaga-nvim # extra UI for lsp

    # Languages
    vim-nix # nix
    lsp_signature-nvim
    pkgs.texlab # latex
    pkgs.sumneko-lua-language-server # lua
    # pkgs.nodePackages.pyright # Python
    pkgs.python39Packages.python-lsp-server
  ];

  use.lspconfig.pylsp.setup = callWith {
    cmd = [ "${pkgs.python39Packages.python-lsp-server}/bin/pylsp" ];
  };

  # Python
  #use.lspconfig.pyright.setup = callWith {
  #  cmd = [ "${pkgs.nodePackages.pyright}/bin/pyright-langserver" ];
  #};

  # To have nice function signature show up in insert mode
  setup.lsp_signature = callWith { };

  # Lua
  use.lspconfig.sumneko_lua.setup = callWith {
    cmd = [ "${pkgs.sumneko-lua-language-server}/bin/lua-language-server" ];
    settings = {
      Lua = {
        diagnostics = {
          # Get the language server to recognize the `vim` global
          globals = [ "vim" ];
        };
      };
    };
  };

  # Nix
  use.lspconfig.rnix.setup = callWith {
    cmd = [ "${pkgs.rnix-lsp}/bin/rnix-lsp" ];
    capabilities = rawLua "require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())";
  };

  # Latex
  use.lspconfig.texlab.setup = callWith {
    cmd = [ "${pkgs.texlab}/bin/texlab" ];
  };
}
