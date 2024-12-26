let
  npins = import ./npins;
  importFlake = src: (import npins.flake-compat { inherit src; }).defaultNix;
in
npins
// builtins.mapAttrs (_: importFlake) {
  inherit (npins)
    home-manager
    lanzaboote
    nixpkgs
    nixvim
    nur
    plasma-manager
    ;
}
