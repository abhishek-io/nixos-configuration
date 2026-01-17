{
  description = "Abhishek's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # ...
    nixosConfigurations = {
      "nixos-ap" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Ensure this matches your system architecture
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-ap/configuration.nix
          # You can add other system-level modules here if you like
          # You can add other system-level modules here if you like
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
