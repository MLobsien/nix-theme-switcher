{
  description = "Runtime theme switcher for NixOS using stylix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix.url = "github:nix-community/stylix";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs @ {
    nixpkgs,
    stylix,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    theme-switcher = import ./. {inherit stylix;};
  in {
    nixosModules.default = theme-switcher.nixosModules.default;
    homeManagerModules.default = theme-switcher.homeManagerModules.default;

    nixosConfigurations.example = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        theme-switcher.nixosModules.default
        ./examples/configuration.nix
      ];
    };
  };
}