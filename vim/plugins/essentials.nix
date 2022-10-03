# Essential Configuration
{ lib, config, pkgs, dsl, ... }:
with dsl;
let
  # Quality of life shortenning
  cmd = command: description: [ "<cmd>${command}<cr>" description ];
in
{
  # For plugings that do not (yet) live in nixpkgs!
  plugins = with pkgs.vimPlugins; [
    # command discover
    which-key-nvim

    vim-oscyank # copy anywhere
    comment-nvim # Comments

    undotree # view all undo/repo operations
    # vim-unimpaired # movements options with [
    luasnip # Snippet engine
    friendly-snippets # more snippets
    # Make sure to add mapping for this

    # Dependencies
    deoplete-nvim # async operations (dependency)
    nvim-yarp # dependency for deoplete
    auto-session # Session manager
  ];

  setup.Comment = callWith { };
  lua = lib.mkBefore ''
    -- For developing purposes
    -- Prints table in nice format
    P = function(v)
      print(vim.inspect(v))
      return v
    end

    function strEmpty(s)
      return s == nil or s == ""
    end
    function getCurrDir()
      file = vim.fn.expand("%")
      if strEmpty(file) then
        return vim.fn.getcwd()
      else
        return vim.fn.system("dirname "..file):gsub("%s+", "")
      end
    end
  '';

  # Writes :messages command in quickfix list via :Messages
  vimscript =
    ''
      " Maps escape to leaving insert mode within Terminal mode
      tnoremap <Esc> <C-\><C-n>
    '' + builtins.readFile ./messages_cmd.vim;
}
