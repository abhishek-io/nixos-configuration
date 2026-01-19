{ config, pkgs, inputs, ... }:

{
  # Define a user account.
  users.users.abhishek = {
    isNormalUser = true;
    description = "Abhishek";
    extraGroups = [ "networkmanager" "wheel" ];
    # IMPORTANT: If you change the 'abhishek' username here,
    # make sure to also set a password for the new user after rebuilding your system.
    # You can do this by running:
    # sudo passwd <new_username>
  };

  home-manager.backupFileExtension = "bak";
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.abhishek = import ../home-manager/home.nix;

}
