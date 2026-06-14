{
  stylix,
  home-manager,
}: {
  config,
  lib,
  pkgs,
  ...
} @ specialArgs: let
  cfg = config.nix-theme-switcher;

  inherit (lib) concatStringsSep attrNames concatLines;

  evalTheme = _: themeConfig: let
    nixosEval = import "${pkgs.path}/nixos/lib/eval-config.nix" {
      # inherit specialArgs;
      inherit (pkgs.stdenv.hostPlatform) system;
      modules = let
        stylixCfg = themeConfig // {enable = true;};
      in [
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        {stylix = lib.mkForce stylixCfg;}
        {
          users.users.${cfg.user} = {};
          home-manager.users.${cfg.user} = {
            home = {
              stateVersion = "24.11";
            };
            stylix = lib.mkForce stylixCfg;
          };
        }
        # (lib.removeAttrs config ["_module" "nix-theme-switcher" "passthru"]) #"stylix"])
        # {options = lib.removeAttrs options ["_module" "nix-theme-switcher" "passthru"];}
      ];
    };
  in
    nixosEval.config;

  targets = import ./targets.nix;

  themes' = lib.mapAttrs evalTheme cfg.themes;

  applyTargetsForTheme = theme: let
    themeConfig = themes'.${theme};
    targetsForTheme =
      targets {
        inherit lib;
        inherit (cfg) user;
        config = themeConfig;
      }
      // cfg.targets;
    allTargets =
      themeConfig.stylix.targets
      // themeConfig.home-manager.users.${cfg.user}.stylix.targets;
  in ''
    "${theme}")
    ${lib.pipe allTargets [
      (lib.filterAttrs (name: stylixTarget: let
        target = targetsForTheme.${name};
      in
        stylixTarget.enable && target.enable != null && target.enable))
      (lib.mapAttrsToList (
        name: _: let
          target = targetsForTheme.${name};
        in
          concatLines (map (file:
            if target.dest != null
            then "ln -sf ${target.dest} ${file}"
            else "")
          target.configFiles)
          + (target.reload or "")
      ))
      concatLines
    ]}
    ;;
  '';

  themeNames = attrNames themes';

  applyThemes = pkgs.writeShellScriptBin "nix-theme-switcher-apply" ''
    applyTheme() {
      case "$1" in
        ${concatLines (map applyTargetsForTheme themeNames)}
      esac
    }

    CHOICE=$(echo -e "${concatStringsSep "\\n" themeNames}" | ${cfg.frontend})
    applyTheme $CHOICE
  '';
in {
  options.nix-theme-switcher = {
    enable = lib.mkEnableOption "nix-theme-switcher";

    user = lib.mkOption {
      type = lib.types.str;
      default = "stylix";
    };

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
      type = with lib.types; attrsOf anything;
      readOnly = true;
      internal = true;
    };
  };

  config.nix-theme-switcher = lib.mkIf cfg.enable {
    inherit themes';
  };
}
