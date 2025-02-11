{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
{
  security.acme = {
    acceptTerms = true;
    certs = {
      "pnm.tf" = {
        extraDomainNames = [ "*.pnm.tf" ];
        email = "pnm@pnm.tf";
        dnsProvider = "ovh";
        environmentFile = "/var/lib/secrets/ovh-dns-zone";
        group = "nginx";
      };
    };
  };
}
