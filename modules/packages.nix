{ config, pkgs, inputs, ... }:


{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # System tools
    gemini-cli
    git
    gnupg
    wget
    curl
    neovim
    tmux
    htop
    ncdu
    tree
    jq
    yq
    unzip
    zip
    alacritty
    google-antigravity # Google Antigravity IDE
  ];
}
