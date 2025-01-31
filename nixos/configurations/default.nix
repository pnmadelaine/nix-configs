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
lib.genAttrs [ "mikhail" "tal" ] (
  hostname:
  lib.nixosSystem {
    inherit system;
    modules = [
      (sources.disko + "/module.nix")
      ./${hostname}
    ];
    specialArgs = {
      modules = lib.mapAttrs (m: _: /${modulesPath}/${m}) (builtins.readDir /${modulesPath});
      inherit sources;
      inherit root;
    };
  }
)
