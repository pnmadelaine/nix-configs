{
  config,
  exrtaSpecialArgs,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    cargo
    crate2nix
    gcc
    nixd
    rust-analyzer
    rustfmt
  ];
}
