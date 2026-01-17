{ config, pkgs, ... }:


{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Core utils
    wget
    curl
    git
    zip
    unzip

    # System tools
    gemini-cli
    xfce4-terminal
    betterlockscreen
    (pkgs.runCommand "xflock4" { buildInputs = [ pkgs.makeWrapper ]; } ''
      mkdir -p $out/bin
      makeWrapper ${pkgs.betterlockscreen}/bin/betterlockscreen $out/bin/xflock4 --add-flags "-l"
    '')

    # Media
    vlc
  ];
}
