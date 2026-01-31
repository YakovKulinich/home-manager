{
  description = "Home Manager configuration";

  inputs = {
    # Use unstable or a specific release
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # Adjust to your system (e.g., aarch64-darwin)
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."yakov" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ]; # Path to your home.nix
      };
    };
}
