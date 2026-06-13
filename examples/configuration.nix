{ pkgs, ... }: {
  # ─── Basic system config ───────────────────────────────────────────

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "theme-switcher-example";

  users.users.alice = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "alice";
  };

  # Required packages for the switch script
  environment.systemPackages = with pkgs; [
    jq
    rofi
  ];

  # ─── nix-theme-switcher ────────────────────────────────────────────

  nix-theme-switcher = {
    enable = true;

    # Which theme is active after nixos-rebuild (the "default" at boot)
    defaultTheme = "nord";

    # Which programs to manage symlinks for.
    # Only programs listed here will have their config files symlinked.
    # Defaults to all targets in targets.nix if omitted.
    targets = [ "gtk" "stylix-palette" ];

    # ─── Theme definitions ──────────────────────────────────────────
    #
    # Each key is a theme name, each value is a stylix option set.
    # Anything stylix accepts can go here.
    #
    # The simplest theme needs only an image and polarity.
    # Stylix auto-generates the entire color palette from the image
    # using its Haskell palette generator. No manual color picking needed.
    #
    #   minimal-dark = {
    #     stylix.image = ./wallpapers/some-photo.png;
    #     stylix.polarity = "dark";
    #   };
    #
    # You can also specify colors explicitly via stylix.base16Scheme
    # or override individual generated colors with stylix.override.

    themes = {
      # Minimalist theme — just an image. Stylix generates colors automatically.
      nord = {
        stylix.image = ./wallpapers/nord.png;
        stylix.polarity = "dark";
      };

      # Light theme using an explicit base16 YAML scheme.
      # No image needed — colors are defined directly.
      solarized-light = {
        stylix.base16Scheme = ./schemes/solarized-light.yaml;
        stylix.polarity = "light";

        stylix.fonts = {
          sansSerif = {
            name = "Fira Sans";
            package = pkgs.fira;
          };
        };
      };

      # Dark theme using a YAML scheme from the internet or local path.
      tokyo-night = {
        stylix.base16Scheme = ./schemes/tokyo-night-dark.yaml;
        stylix.image = ./wallpapers/tokyo-night.png;
        stylix.polarity = "dark";
      };

      # Dark theme with an inline base16 scheme (no external file needed).
      # Useful for schemes not in the base16 catalogue.
      catppuccin-mocha = {
        stylix.base16Scheme = {
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
        stylix.image = ./wallpapers/catppuccin.png;
        stylix.polarity = "dark";
      };
    };

    # Override the frontend picker (default: rofi -dmenu)
    # Any command that reads theme names from stdin and prints the
    # chosen name to stdout works here.
    frontend = ''
      ${pkgs.rofi}/bin/rofi -dmenu -i -p "Theme"
    '';
  };

  # ─── Active stylix config (for the default theme) ──────────────────
  #
  # nix-theme-switcher evaluates each theme independently with
  # lib.evalModules. But the *active* NixOS-wide stylix config (the one
  # that sets system fonts, cursor, GTK icon theme, etc.) still needs to
  # be configured separately. This should match your defaultTheme.
  #
  # After running `nix-theme-switch <other-theme>`, the per-program
  # config FILES (gtk.css, etc.) get swapped to the new theme, but
  # NixOS-level options (fonts, cursor, icon theme) remain set to this
  # default until the next nixos-rebuild.

  stylix.enable = true;
  stylix.image = ./wallpapers/nord.png;
  stylix.polarity = "dark";

  # ─── VM / testing convenience ───────────────────────────────────────

  # Allow passwordless sudo for the example user
  security.sudo.wheelNeedsPassword = false;

  # Basic services needed for graphical testing
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # OpenSSH for remote access if testing in a VM
  services.openssh.enable = true;

  system.stateVersion = "24.11";
}