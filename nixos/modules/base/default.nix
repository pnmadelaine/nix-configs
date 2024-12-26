{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
  };

  nixpkgs.flake = {
    setFlakeRegistry = true;
    setNixPath = true;
  };

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_IE.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "fr";
      variant = "bepo";
    };
  };

  programs.zsh.enable = true;

  users.users.pnm = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
    ];
  };
}
