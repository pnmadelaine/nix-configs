{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  programs.bash.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  home.shellAliases = {
    c = "xclip -selection clipboard";
    v = "nvim";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
  };

  programs.btop.enable = true;
  programs.fd.enable = true;
  programs.man.enable = true;
  programs.ripgrep.enable = true;
  programs.yazi.enable = true;

  home.packages = with pkgs; [
    jless
    jq
    nixfmt-rfc-style
    python3
    tree
    unzip
    xclip
  ];
}
