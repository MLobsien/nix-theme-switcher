{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    stylix.url = "github:nix-community/stylix";

    nix-theme-switcher.url = "path:../.";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    stylix,
    nix-theme-switcher,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.example = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        nix-theme-switcher.nixosModules.default
        ./configuration.nix
        ./themes.nix
      ];
    };
  };
}
