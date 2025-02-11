{
  lib,
  modulesPath,
  pkgs,
  specialArgs,
  ...
}:
{
  imports = with specialArgs.modules; [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
    acme
  ];

  services.nginx = {
    enable = true;
    virtualHosts."pnm.tf" = {
      forceSSL = true;
      useACMEHost = "pnm.tf";
      locations."/" = {
        root = import specialArgs.sources.website { inherit pkgs; };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = import (specialArgs.root + "/keys.nix");

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  system.stateVersion = "24.11";
}
