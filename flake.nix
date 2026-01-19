{
  description = "Abhishek's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    antigravity-nix.url = "github:jacopone/antigravity-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # ...
    nixosConfigurations = {
      "nixos-ap" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Ensure this matches your system architecture
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-ap/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      # Add more NixOS configurations for other machines here, e.g.:
      # "my-server" = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   specialArgs = { inherit self; };
      #   modules = [
      #     ./hosts/my-server/configuration.nix
      #   ];
      # };
    };

    # You can also define other outputs here, like development shells, packages, etc.
    # devShells.x86_64-linux.default = nixpkgs.mkShell {
    #   packages = with nixpkgs; [
    #     nodejs
    #     python3
    #   ];
    # };
  };
}
