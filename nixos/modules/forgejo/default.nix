{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
let
  port = 3000;
in
{
  services.forgejo = {
    enable = true;
    database.type = "postgres";
    settings = {
      server = {
        DOMAIN = "git.pnm.tf";
        ROOT_URL = "https://git.pnm.tf/"; # specify this to remove the port from URLs in the web UI.
        HTTP_PORT = port;
      };
      service.DISABLE_REGISTRATION = true;
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts."git.pnm.tf" = {
      forceSSL = true;
      useACMEHost = "pnm.tf";
      locations."/" = {
        proxyPass = "http://localhost:${builtins.toString port}";
      };
    };
  };
}
