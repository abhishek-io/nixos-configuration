{ pkgs, config, ... }:

{
  # XFCE Desktop Environment
  services.xserver.desktopManager.xfce.enable = true;


  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    inter
  ];


  # Set the wallpaper for betterlockscreen on login.
  # This assumes your wallpaper is at /etc/nixos/bg.jpg
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.betterlockscreen}/bin/betterlockscreen -u /home/abhishek/nixos-configuration/hosts/nixos-ap/bg.jpg &
  '';

  # Firefox
  programs.firefox = {
    enable = true;
    policies = {
      "Preferences" = {
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      };
    };
  };
}
