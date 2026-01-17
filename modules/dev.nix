{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Basic development tools
    neovim
    gcc
    gnumake

    # Nix specific tools
    nix-direnv

    # Programming languages
    nodejs
    nodePackages.npm
    nodePackages.typescript
    python3
    python3Packages.pip
  ];

  # Enable direnv and nix-direnv for automatic environment loading
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
