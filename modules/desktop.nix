{ pkgs, config, ... }:

{
  # GNOME Desktop Environment
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true; # Use GDM for GNOME
  
  environment.gnome.excludePackages = with pkgs; [
    epiphany # Web browser
    geary # Email client
    gnome-calculator # Calculator
    gnome-calendar # Calendar
    gnome-contacts # Contacts
    gnome-maps # Maps
    gnome-music # Music player
    gnome-photos # Photo viewer
    gnome-text-editor # Text editor
    gnome-weather # Weather app
    totem # Video player
    rhythmbox # Music player
    evolution # Email client
    yelp # Help browser
    gnome-tour # GNOME Tour
    five-or-more # Game
    hitori # Game
    iagno # Game
    lightsoff # Game
    quadrapassel # Game
    seahorse # Password and Keys
    shotwell # Photo manager
    simple-scan # Document scanner
    tali # Game
    gnome-terminal # Terminal
  # nautilus # Files
    gnome-boxes # Virtual Machines
    gnome-disk-utility # Disks
    baobab # Disk Usage Analyzer
    eog # Eye of GNOME - Image Viewer
    evince # Document Viewer
    gnome-font-viewer # Font Viewer
    gnome-system-monitor # System Monitor
  # gnome-screenshot # Screenshot Tool
    gnome-characters # Character Map
  ];

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    inter
  ];

  # GNOME Extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-panel
    gnome-tweaks
  ];

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
