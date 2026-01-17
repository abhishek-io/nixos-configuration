{ config, pkgs, lib, ... }:

{
  imports =
    [
      # Import the hardware-specific configuration for this host.
      ./hardware-configuration.nix

      ../../modules/system.nix
      ../../modules/packages.nix
      ../../modules/services.nix
      ../../modules/desktop.nix
      ../../modules/user.nix
      ../../modules/dev.nix
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "25.11"; # Did you read the comment?
}
