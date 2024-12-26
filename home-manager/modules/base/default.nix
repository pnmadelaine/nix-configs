{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  home.username = "pnm";
  home.homeDirectory = "/home/pnm";
  programs.home-manager.enable = true;
}
