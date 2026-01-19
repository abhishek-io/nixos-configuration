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
    htop
    tree
    unzip
    zip
    antigravity # Google Antigravity IDE
  ];
}
