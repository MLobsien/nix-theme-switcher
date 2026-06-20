{
  description = "Runtime theme switcher for NixOS using stylix";

  inputs = {
    stylix.url = "github:nix-community/stylix";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {
    stylix,
    home-manager,
    ...
  }: {
    nixosModules.default = {config, ...}: {
      imports = [
        (import ./.
          {
            inherit stylix home-manager;
            hmConfigPath = ["home-manager" "users" config.nix-theme-switcher.user];
          })
      ];
    };

    homeModules.default = import ./. {
      inherit stylix home-manager;
      hmConfigPath = [];
    };
  };
}
