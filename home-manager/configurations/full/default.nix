{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  imports = with specialArgs.modules; [
    base
    desktop
    development
    firefox
    git
    neovim
    shell
  ];

  home.stateVersion = "24.05";
}
