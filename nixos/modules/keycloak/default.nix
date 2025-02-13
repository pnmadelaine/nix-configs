{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
let
  http-port = 8080;
  https-port = 8443;
in
{
  services.keycloak = {
    enable = true;
    settings = {
      hostname = "identity.pnm.tf";
      inherit http-port https-port;
    };
    database = {
      passwordFile = "/var/lib/secrets/keycloak-db-password";
    };
    sslCertificate = "/var/lib/acme/pnm.tf/cert.pem";
    sslCertificateKey = "/var/lib/acme/pnm.tf/key.pem";
  };

  services.nginx = {
    enable = true;
    virtualHosts."identity.pnm.tf" = {
      forceSSL = true;
      useACMEHost = "pnm.tf";
      locations."/" = {
        proxyPass = "https://localhost:${builtins.toString https-port}";
      };
    };
  };
}
