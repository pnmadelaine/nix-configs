{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  programs.git = {
    enable = true;

    userName = "Paul-Nicolas Madelaine";
    userEmail = "pnm@pnm.tf";

    ignores = [
      # misc
      "*.swp"
      "*~"
      # direnv
      ".direnv"
      ".envrc"
      # nix
      "result"
      "result-*"
      "build-env"
      "build-env-*"
      # rust
      "target"
      # cmake
      "CMakeCache.txt"
      "CMakeFiles"
      "cmake_install.cmake"
      # python
      "__pycache__"
    ];

    extraConfig.init.defaultBranch = "main";
  };
}
