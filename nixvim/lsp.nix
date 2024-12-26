{
  plugins.lsp = {
    enable = true;

    servers.nixd.enable = true;

    servers.rust_analyzer = {
      enable = true;
      installCargo = false;
      installRustc = false;
    };
  };

  plugins.lsp-format.enable = true;
}
