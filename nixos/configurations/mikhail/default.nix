{
  config,
  lib,
  modulesPath,
  pkgs,
  specialArgs,
  ...
}:
{
  imports = with specialArgs.modules; [
    (modulesPath + "/installer/scan/not-detected.nix")
    base
    desktop
    secureboot
  ];

  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  system.stateVersion = "24.05";

  # hardware...

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "thunderbolt"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d53b5c0a-647b-4e7f-9256-f1d6e4e41b86";
    fsType = "btrfs";
    options = [ "subvol=root" ];
  };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/df16bc80-6343-4218-8381-94859fb3a39b";

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/d53b5c0a-647b-4e7f-9256-f1d6e4e41b86";
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/d53b5c0a-647b-4e7f-9256-f1d6e4e41b86";
    fsType = "btrfs";
    options = [ "subvol=data" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4C3C-9B82";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/831c11ef-fffb-4103-8394-9790f281d742"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
