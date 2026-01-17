{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "abhishek";
  home.homeDirectory = "/home/abhishek";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the Home Manager release, first create a NixOS generation with
  # the old release, and then once you're on the new generation, modify this
  # value.
  home.stateVersion = "23.11"; # Please read the comment before changing.



  # Alacritty terminal emulator (now managed by Home Manager)
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };
        size = 13;
      };
      window = {
        opacity = 0.85;
      };
    };
  };

  # Other programs and configurations for the user can go here.
}
