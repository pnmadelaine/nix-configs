let
  sources = import ./sources;
in
{
  system ? builtins.currentSystem,
  pkgs ? import sources.nixpkgs { inherit system; },
}:
pkgs.mkShell {
  packages = [
    pkgs.home-manager
    pkgs.nixfmt-rfc-style
    pkgs.npins
  ];
  shellHook = ''
    export ROOT="$(pwd)"
    export NPINS_DIRECTORY="$ROOT/sources/npins" 
    export PATH="$PATH:$ROOT/scripts"
  '';
}
