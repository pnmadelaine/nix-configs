{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  imports = [ specialArgs.sources.plasma-manager.homeManagerModules.plasma-manager ];

  programs.zsh.initExtra = ''
    [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ] && exec startplasma-wayland
  '';

  programs.plasma =
    let
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/PastelHills/contents/images/1920x1200.jpg";
    in
    {
      enable = true;
      workspace.wallpaper = wallpaper;
      kscreenlocker.appearance.wallpaper = wallpaper;
      hotkeys.commands."launch-kitty" = {
        name = "Launch Terminal";
        key = "Meta+Return";
        command = "kitty";
      };
    };

  programs.kitty = {
    enable = true;
    themeFile = "Solarized_Light";
    settings = {
      enable_audio_bell = false;
      disable_ligatures = "always";
    };
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    keepassxc
    fira-code
    signal-desktop
  ];
}
