# Git in vim plugin from tpope
{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    nvim-dap # Core
    nvim-dap-ui # To have a modular IntelliJ style UI
    nvim-dap-virtual-text # To show realized variable values
    telescope-dap-nvim

    # Python
    pkgs.python310Packages.debugpy # TODO: Should this be installed in Python projects instead of system-wide like here?

    # Lua
    #one-small-step-for-vimkind
  ];

  setup.dapui = callWith { };
  setup.nvim-dap-virtual-text = callWith { };
  lua = builtins.readFile ./dap.lua;
}
