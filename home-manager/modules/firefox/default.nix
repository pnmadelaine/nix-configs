{
  config,
  lib,
  pkgs,
  specialArgs,
  ...
}:
let
  nur = import specialArgs.sources.nur {
    nurpkgs = pkgs;
    inherit pkgs;
  };
in
{
  programs.firefox = {
    enable = true;
    profiles.pnm = {
      settings = {
        "accessibility.typeaheadfind.enablesound" = false;
        "app.shield.optoutstudies.enabled" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.homepage" = "https://google.com/";
        "browser.translations.enable" = false;
        "browser.urlbar.trimURLs" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "extensions.autoDisableScopes" = 0;
        "extensions.formautofill.creditCards.enabled" = false;
        "intl.regional_prefs.use_os_locales" = true;
        "layout.spellcheckDefault" = 0;
        "signon.autofillForms" = false;
        "signon.generation.enabled" = false;
        "signon.management.page.breach-alerts.enabled" = false;
        "signon.rememberSignons" = false;
      };
      extensions = with nur.repos.rycee.firefox-addons; [
        clearurls
        i-dont-care-about-cookies
        keepassxc-browser
        ublock-origin
      ];
    };
  };
}
