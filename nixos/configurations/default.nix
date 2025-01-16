let
  root = ../..;
  sources = import /${root}/sources;
  modulesPath = /${root}/nixos/modules;
in
{
  system ? builtins.currentSystem,
  pkgs ? import sources.nixpkgs { inherit system; },
  lib ? sources.nixpkgs.lib,
}:
lib.genAttrs [ "mikhail" ] (
  hostname:
  lib.nixosSystem {
    inherit system;
    modules = [
      ./${hostname}
    ];
    specialArgs = {
      modules = lib.mapAttrs (m: _: /${modulesPath}/${m}) (builtins.readDir /${modulesPath});
      inherit sources;
    };
  }
)
