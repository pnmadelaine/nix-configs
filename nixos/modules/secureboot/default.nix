{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  imports = [ specialArgs.sources.lanzaboote.nixosModules.lanzaboote ];
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
