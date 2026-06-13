{
  pkgs,
  lib,
  stylix,
}: let
  /*
   * Evaluate a single theme configuration using lib.evalModules.
   * Uses the full NixOS module set + stylix so that all stylix targets
   * are evaluated and their output files land in config as usual.
   *
   * Each theme evaluation reuses the outer pkgs via nixpkgs.pkgs
   * to avoid rebuilding the package set per theme.
   */
  evalTheme = themeConfig: let
    result = lib.evalModules {
      class = "nixos";
      specialArgs = {
        modulesPath = toString "${pkgs.path}/nixos/modules";
      };
      modules =
        (import "${pkgs.path}/nixos/modules/module-list.nix")
        ++ [
          stylix.nixosModules.stylix
          {stylix.enable = true;}
          {nixpkgs.pkgs = pkgs;}
          /*
           * Provide a minimal boot config to prevent evaluation errors.
           * Without this, evaluating the full NixOS module set would
           * require boot-related options to be set.
           */
          {
            boot.loader.systemd-boot.enable = true;
            fileSystems."/".device = "/dev/sda1";
          }
          themeConfig
        ];
    };
  in result.config;

  /*
   * Build a theme package from an evaluated theme config.
   *
   * Structure:
   *   /nix/store/...-theme-<name>/
   *   ├── theme.json           # { name, polarity }
   *   ├── name                  # plain text theme name
   *   ├── polarity              # "dark" or "light"
   *   ├── palette.json          # base16 palette
   *   ├── wallpaper             # symlink to wallpaper image (if set)
   *   ├── etc/                  # files from environment.etc (system-level)
   *   └── xdg/                  # XDG config files (user-level)
   */
  buildThemePackage = name: themeConfig: let
    colors = themeConfig.lib.stylix.colors;
    polarity = themeConfig.stylix.polarity;
    wallpaper = themeConfig.stylix.image;

    # Collect NixOS-level files from environment.etc that stylix created
    etcFiles = themeConfig.environment.etc or {};
    stylixEtcFiles = lib.filterAttrs (n: _: lib.hasPrefix "stylix/" n) etcFiles;

    # Build base16 palette as attrset
    hexIndices = [
      "00" "01" "02" "03" "04" "05" "06" "07"
      "08" "09" "0a" "0b" "0c" "0d" "0e" "0f"
    ];
    palette = builtins.listToAttrs (map (hex: {
      name = "base${hex}";
      value = colors."base${hex}" or "";
    }) hexIndices);

    # GTK CSS from base16 colors
    gtkCss = let c = colors.withHashtag;
    in pkgs.writeText "gtk.css" ''
      @define-color bg_color ${c.base00};
      @define-color fg_color ${c.base05};
      @define-color base_color ${c.base00};
      @define-color text_color ${c.base05};
      @define-color selected_bg_color ${c.base0D};
      @define-color selected_fg_color ${c.base0E};
      @define-color tooltip_bg_color ${c.base00};
      @define-color tooltip_fg_color ${c.base05};
      @define-color link_color ${c.base0D};
    '';
  in
    pkgs.runCommandNoCC "theme-${name}" {} ''
      mkdir -p $out

      # Theme metadata
      cat > $out/theme.json << 'EOF'
      ${builtins.toJSON {inherit name polarity;}}
      EOF
      echo "${name}" > $out/name
      echo "${polarity}" > $out/polarity

      # Palette (base16 colors)
      cat > $out/palette.json << 'PALETTE_EOF'
      ${builtins.toJSON palette}
      PALETTE_EOF

      # Stylix-generated NixOS-level files
      mkdir -p $out/etc
      ${lib.concatStringsSep "\n" (lib.mapAttrsToList (path: desc: let
        target = "etc/${path}";
        dir = dirOf target;
      in ''
        mkdir -p $out/${dir}
        cp ${desc.source} $out/${target}
      '') stylixEtcFiles)}

      # GTK CSS (from stylix colors)
      mkdir -p $out/xdg/gtk-3.0
      mkdir -p $out/xdg/gtk-4.0
      cp ${gtkCss} $out/xdg/gtk-3.0/gtk.css
      cp ${gtkCss} $out/xdg/gtk-4.0/gtk.css

      # Wallpaper (if set)
      ${lib.optionalString (wallpaper != null) ''
        ln -sfn "${wallpaper}" $out/wallpaper
      ''}
    '';
in {
  inherit evalTheme buildThemePackage;
}