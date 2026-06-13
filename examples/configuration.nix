{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  networking.hostName = "theme-switcher-example";

  users.users.alice = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "alice";
  };

  environment.systemPackages = with pkgs; [
    rofi
  ];

  nix-theme-switcher = {
    enable = true;

    themes = {
      nord = {
        image = ./wallpapers/nord.png;
        polarity = "dark";
      };

      solarized-light = {
        base16Scheme = ./schemes/solarized-light.yaml;
        polarity = "light";

        fonts = {
          sansSerif = {
            name = "Fira Sans";
            package = pkgs.fira;
          };
        };
      };

      # Dark theme using a YAML scheme from the internet or local path.
      tokyo-night = {
        base16Scheme = ./schemes/tokyo-night-dark.yaml;
        image = ./wallpapers/tokyo-night.png;
        polarity = "dark";
      };

      # Dark theme with an inline base16 scheme (no external file needed).
      # Useful for schemes not in the base16 catalogue.
      catppuccin-mocha = {
        base16Scheme = {
          base00 = "1e1e2e";
          base01 = "181825";
          base02 = "313244";
          base03 = "45475a";
          base04 = "585b70";
          base05 = "bac2de";
          base06 = "a6adc8";
          base07 = "cdd6f4";
          base08 = "f38ba8";
          base09 = "fab387";
          base0A = "f9e2af";
          base0B = "a6e3a1";
          base0C = "94e2d5";
          base0D = "89b4fa";
          base0E = "cba6f7";
          base0F = "f2cdcd";
        };
        image = ./wallpapers/catppuccin.png;
        polarity = "dark";
      };
    };
  };

  stylix.enable = true;
  stylix.image = ./wallpapers/nord.png;
  stylix.polarity = "dark";

  security.sudo.wheelNeedsPassword = false;

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "24.11";
}
