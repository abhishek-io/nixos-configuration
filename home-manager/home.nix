{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

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


  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "abhishek-io";
        email = "myselfabhi.327@gmail.com";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
      alias = {
        co = "checkout";
        ci = "commit";
        st = "status";
        br = "branch";
        hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
      };
    };
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      path = "gsa9otdn.default";
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        "browser.startup.homepage.url" = "https://google.com";
        "browser.search.defaultenginename" = "Google";
        "browser.compactmode.show" = true;
      };
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        darkreader
      ];
    };
    policies = {
      "Preferences" = {
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      };
    };
  };

  # Other programs and configurations for the user can go here.

  home.packages = with pkgs; [
    vlc
    loupe
    alacritty
    tmux
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };
        bold = {
          family = "JetBrains Mono";
          style = "Bold";
        };
        italic = {
          family = "JetBrains Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrains Mono";
          style = "Bold Italic";
        };
        size = 11.0;
      };
      colors = {
        primary = {
          background = "#000000";
          foreground = "#ffffff";
        };
      };
      window = {
        opacity = 0.8;
      };
      terminal = {
        shell = {
          program = "${pkgs.tmux}/bin/tmux";
          args = [ "new-session" "-A" "-s" "main" ];
        };
      };
    };
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-a";
    extraConfig = ''
      bind -n C-t new-window
      bind -n C-w kill-pane
    '';
  };


  xdg.mimeApps.defaultApplications = {
    "image/jpeg" = "org.gnome.Loupe.desktop";
    "image/png" = "org.gnome.Loupe.desktop";
    "image/gif" = "org.gnome.Loupe.desktop";
    "video/mp4" = "vlc.desktop";
    "video/webm" = "vlc.desktop";
    "video/x-matroska" = "vlc.desktop";
  };
}
