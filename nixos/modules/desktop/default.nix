{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  networking.networkmanager.enable = true;
  services.printing.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.startx.enable = true;
}
