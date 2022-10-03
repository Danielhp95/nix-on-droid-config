{ dsl, ... }:

with dsl;
{
  vim.g = {
    mapleader = " ";
    nofoldenable = true;
    completeopt = "menu,menuone,noselect";
    noswapfile = true;
    oscyank_max_length = 100000000;
    timeoutlen = 100;
  };
  vim.o = {
    grepprg = "rg --vimgrep --no-heading --smart-case";
    grepformat = "%f:%l:%c:%m,%f:%l:%m";
    relativenumber = true;
    autoread = true;
    showcmd = true;
    showmatch = true;
    ignorecase = true;
    smartcase = true;
    termguicolors = true;
    inccommand = "split";
    incsearch = true;
    tabstop = 2;
    shiftwidth = 2;
    cursorline = true;
    wrap = true;
    autoindent = true;
    copyindent = true;
    splitbelow = false;
    splitright = true;
    number = true;
    # This breaks nvim by making the file title show up everytime there's an addition!!!
    #  title = true;
    undofile = true;
    hidden = true;
    list = true;
    background = "dark";
    backspace = "indent,eol,start";
    undolevels = 1000000;
    undoreload = 1000000;
    foldmethod = "indent";
    foldnestmax = 10;
    foldlevel = 10;
    scrolloff = 3;
    sidescrolloff = 5;
    listchars = "tab:→→,trail:●,nbsp:○";
    clipboard = "unnamed,unnamedplus";
    formatoptions = "tcqj";
    encoding = "utf-8";
    fileencoding = "utf-8";
    fileencodings = "utf-8";
    bomb = true;
    binary = true;
    matchpairs = "(:),{:},[:],<:>";
    expandtab = true;
    wildmode = "list:longest,list:full";
  };
}
