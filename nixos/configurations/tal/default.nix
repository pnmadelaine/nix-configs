{
  lib,
  modulesPath,
  pkgs,
  specialArgs,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];

  services.nginx = {
    enable = true;
    virtualHosts."pnm.tf" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        root = import specialArgs.sources.website { inherit pkgs; };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  security.acme.certs."pnm.tf".email = "pnm@pnm.tf";
  security.acme.acceptTerms = true;

  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = import (specialArgs.root + "/keys.nix");

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  system.stateVersion = "24.11";
}
