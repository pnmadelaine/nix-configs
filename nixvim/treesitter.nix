{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      haskell
      json
      lua
      make
      markdown
      nix
      regex
      rust
      toml
    ];
    settings = {
      highlight.enable = true;
    };
  };
}
