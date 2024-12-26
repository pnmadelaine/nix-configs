{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  imports = [ specialArgs.sources.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  } // import /${specialArgs.root}/nixvim;
}
