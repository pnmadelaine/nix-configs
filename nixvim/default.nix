{
  imports = [
    ./git.nix
    ./lsp.nix
    ./telescope.nix
    ./terminal.nix
    ./treesitter.nix
  ];

  globals.mapleader = " ";

  opts = {
    # search
    ignorecase = true;
    smartcase = true;
    # tabs
    expandtab = true;
    shiftwidth = 4;
    softtabstop = 4;
    tabstop = 4;
    # ui
    background = "light";
    cursorline = true;
    number = true;
    numberwidth = 4;
    signcolumn = "yes:1";
  };

  colorschemes.base16 = {
    enable = true;
    colorscheme = "solarized-light";
  };

  plugins.cmp-emoji.enable = true;
  plugins.cmp.enable = true;
  plugins.mini.enable = true;
  plugins.nvim-tree.enable = true;
  plugins.project-nvim.enable = true;
  plugins.remote-nvim.enable = true;
  plugins.render-markdown.enable = true;
  plugins.which-key.enable = true;
}
