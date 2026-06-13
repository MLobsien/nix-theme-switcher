{
  stylix,
  home-manager,
}: {
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nix-theme-switcher;

  inherit (lib) concatStringsSep attrNames concatLines;

  evalTheme = _: themeConfig: let
    modulesPath = "${pkgs.path}/nixos/modules";
    result = lib.evalModules {
      class = "nixos";
      specialArgs = {inherit modulesPath;};
      modules =
        (import "${modulesPath}/module-list.nix")
        ++ [
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            stylix =
              (config.stylix or {})
              // themeConfig
              // {
                enable = true;
              };
          }
          {
            home-manager = {
              useGlobalPkgs = true;
              users.stylix = {
                home.username = "stylix";
                home.homeDirectory = "/home/stylix";
                home.stateVersion = "24.11";
              };
            };
          }
          {
            nixpkgs = {inherit (pkgs.stdenv) hostPlatform;};
            boot.loader.systemd-boot.enable = true;
            fileSystems."/" = {
              device = "/dev/sda1";
              fsType = "ext4";
            };
          }
        ];
    };
  in
    result.config;

  targetsFn = import ./targets.nix;

  themes' = lib.mapAttrs evalTheme cfg.themes;

  themeNames = attrNames themes';

  applyTargetsForTheme = theme: let
    themeConfig = themes'.${theme};
    targets =
      (targetsFn {
        inherit lib;
        config = themeConfig;
      })
      // cfg.targets;
    allTargets = themeConfig.stylix.targets // themeConfig.home-manager.users.stylix.targets;
  in ''
    ${theme})
    ${lib.pipe allTargets [
      (lib.filterAttrs (_: target: target.enable))
      (lib.mapAttrsToList (
        name: _: let
          target = targets.${name};
        in
          concatLines (map (file: "ln -sf ${target.dest} ${file}") target.configFiles)
          + (target.reload or "")
      ))
      concatLines
    ]}
    ;;
  '';

  applyThemes = pkgs.writeShellScript "nix-theme-switcher-apply" ''
    applyTheme() {
      case "$1" in
        ${concatLines (map applyTargetsForTheme themeNames)}
      esac
    }

    CHOICE=$(echo ${concatStringsSep "\\\n" themeNames} | ${cfg.frontend})
    applyTheme $CHOICE
  '';
in {
  options.nix-theme-switcher = {
    enable = lib.mkEnableOption "nix-theme-switcher";

    themes = lib.mkOption {
      type = with lib.types; attrsOf (lazyAttrsOf anything);
      default = {};
      description = "Attribute set of stylix configurations.";
      example = lib.literalExpression ''
        {
          nord = {
            image = ./wallpapers/nord.png;
            polarity = "dark";
          };
          solarized-light = {
            base16Scheme = ./schemes/solarized-light.yaml;
            polarity = "light";
          };
        }
      '';
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = applyThemes;
    };

    targets = lib.mkOption {
      type = with lib.types; attrsOf anything;
      default = {};
      description = "Override the config location or reload commands for a target";
    };

    frontend = lib.mkOption {
      type = lib.types.lines;
      default = ''
        ${pkgs.rofi}/bin/rofi -dmenu -p "Theme"
      '';
      defaultText = "rofi -dmenu -p Theme";
      description = "Command to display theme choices. Reads newline separated theme names from stdin, prints chosen name to stdout.";
    };

    themes' = lib.mkOption {
      type = with lib.types; attrsOf package;
      readOnly = true;
      internal = true;
    };
  };

  config.nix-theme-switcher = lib.mkIf cfg.enable {
    inherit themes';
  };
}
