let
  root = ../..;
  sources = import /${root}/sources;
  modulesPath = /${root}/home-manager/modules;
  nixpkgs = sources.nixpkgs;
  home-manager = sources.home-manager;
  lib = nixpkgs.lib;
in
{
  system ? builtins.currentSystem,
  pkgs ? import nixpkgs { inherit system; },
}:
lib.genAttrs [ "full" ] (
  name:
  home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [ ./${name} ];
    extraSpecialArgs = {
      modules = lib.mapAttrs (m: _: /${modulesPath}/${m}) (builtins.readDir /${modulesPath});
      inherit root sources;
    };
  }
)
