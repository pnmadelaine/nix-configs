let
  root = ../..;
  sources = import /${root}/sources;
  lib = sources.nixpkgs.lib;
  modulesPath = /${root}/nixos/modules;
in
lib.mapAttrs
  (
    hostname: system:
    lib.nixosSystem {
      inherit system;
      modules = [
        ./${hostname}
        { networking.hostName = hostname; }
      ];
      specialArgs = {
        modules = lib.mapAttrs (m: _: /${modulesPath}/${m}) (builtins.readDir /${modulesPath});
        inherit sources;
      };
    }
  )
  {
    "mikhail" = "x86_64-linux";
  }
