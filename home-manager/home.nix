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

  services.gpg-agent = {
    enable = false;
  };


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

  programs.git = {
    enable = true;
    userName = "abhishek-io";
    userEmail = "myselfabhi.327@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
    };
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        "browser.startup.homepage.url" = "https://google.com";
        "browser.search.defaultenginename" = "Google";
        "browser.compactmode.show" = true;
      };
      extensions = [
        "ublock0@raymondhill.net" # uBlock Origin
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" # Dark Reader
      ];
    };
  };

  # Other programs and configurations for the user can go here.

  home.packages = with pkgs; [
    vlc
  ];
}
