{stylix}: {
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nix-theme-switcher;

  helpers = import ./lib.nix {inherit pkgs lib stylix;};
  targetDefs = import ./targets.nix {inherit lib;};

  inherit (helpers) evalTheme buildThemePackage;

  /*
   * Evaluate each theme and build a store package for it.
   */
  themePackages = lib.mapAttrs (name: themeConfig: let
    themeEval = evalTheme themeConfig;
  in
    buildThemePackage name themeEval)
  cfg.themes;

  defaultThemePkg = themePackages.${cfg.defaultTheme} or null;

  /*
   * Build the registry JSON for the switch script.
   * Each file entry includes its type (xdg/etc) so the script knows
   * whether to place it under $HOME/.config or /etc.
   */
  activeTargets = lib.filterAttrs (name: _: builtins.elem name cfg.targets) targetDefs.targets;

  registryJSON = builtins.toJSON {
    themes = lib.mapAttrs (name: pkg: "${pkg}") themePackages;
    targets = lib.mapAttrs (name: target: {
      files = map (file: let
        type =
          if file ? xdg
          then "xdg"
          else "etc";
        storeRel =
          if file ? xdg
          then "xdg/${file.xdg}"
          else "etc/${file.etc}";
      in {
        inherit type;
        store = storeRel;
        xdgPath = file.xdg or null;
        etcPath = file.etc or null;
      }) target.files;
      inherit (target) reload;
    }) activeTargets;
  };

  /*
   * Build the nix-theme-switch script with a compiled-in registry.
   */
  switchScript = pkgs.writeShellScriptBin "nix-theme-switch" ''
    set -euo pipefail

    REGISTRY='${registryJSON}'

    if [ $# -lt 1 ]; then
      CHOICE=$(echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r '.themes | keys[]' | ${cfg.frontend})
    else
      CHOICE="$1"
    fi

    THEME_PATH=$(echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r --arg t "$CHOICE" '.themes[$t]')
    if [ "$THEME_PATH" = "null" ] || [ -z "$THEME_PATH" ]; then
      echo "Unknown theme: $CHOICE" >&2
      echo "Available themes:" >&2
      echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r '.themes | keys[]' >&2
      exit 1
    fi

    echo "Switching to theme: $CHOICE"
    echo "Theme store path: $THEME_PATH"

    XDG_CONFIG="''${XDG_CONFIG_HOME:-$HOME/.config}"

    for TARGET in $(echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r '.targets | keys[]'); do
      FILE_COUNT=$(echo "$REGISTRY" | ${pkgs.jq}/bin/jq --arg t "$TARGET" '.targets[$t].files | length')

      for i in $(seq 0 $((FILE_COUNT - 1))); do
        TYPE=$(echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r --arg t "$TARGET" --argjson i "$i" '.targets[$t].files[$i].type')
        STORE_REL=$(echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r --arg t "$TARGET" --argjson i "$i" '.targets[$t].files[$i].store')
        STORE_FULL="$THEME_PATH/$STORE_REL"

        if [ "$TYPE" = "xdg" ]; then
          XDG_REL=$(echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r --arg t "$TARGET" --argjson i "$i" '.targets[$t].files[$i].xdgPath')
          CONFIG_PATH="$XDG_CONFIG/$XDG_REL"
        else
          ETC_REL=$(echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r --arg t "$TARGET" --argjson i "$i" '.targets[$t].files[$i].etcPath')
          CONFIG_PATH="/etc/$ETC_REL"
        fi

        CONFIG_DIR=$(dirname "$CONFIG_PATH")
        if [ ! -d "$CONFIG_DIR" ]; then
          mkdir -p "$CONFIG_DIR"
        fi

        if [ -e "$STORE_FULL" ] || [ -L "$STORE_FULL" ]; then
          ln -sfn "$STORE_FULL" "$CONFIG_PATH"
        else
          echo "Warning: Store path $STORE_FULL does not exist, skipping $TARGET:$STORE_REL" >&2
        fi
      done

      RELOAD=$(echo "$REGISTRY" | ${pkgs.jq}/bin/jq -r --arg t "$TARGET" '.targets[$t].reload // empty')
      if [ -n "$RELOAD" ]; then
        echo "Reloading $TARGET..."
        eval "$RELOAD" || true
      fi
    done

    if [ -f "$THEME_PATH/polarity" ]; then
      POLARITY=$(cat "$THEME_PATH/polarity")
      if command -v gsettings &>/dev/null; then
        case "$POLARITY" in
          dark) gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null || true ;;
          light) gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' 2>/dev/null || true ;;
        esac
      fi
    fi

    echo "Theme switched to $CHOICE"
  '';

  listScript = pkgs.writeShellScriptBin "nix-theme-list" ''
    echo '${
      builtins.toJSON (lib.mapAttrs (name: pkg: "${pkg}") themePackages)
    }' | ${pkgs.jq}/bin/jq -r 'keys[]'
  '';
in {
  imports = [(import ./options.nix {inherit lib;})];

  options.nix-theme-switcher = {
    themes = lib.mkOption {
      type = with lib.types; attrsOf (lazyAttrsOf anything);
      default = {};
      description = "Attribute set of theme configurations. Each key is a theme name, each value is a stylix option set.";
      example = lib.literalExpression ''
        {
          nord = {
            stylix.image = ./wallpapers/nord.png;
            stylix.polarity = "dark";
          };
          solarized-light = {
            stylix.base16Scheme = ./schemes/solarized-light.yaml;
            stylix.polarity = "light";
          };
        }
      '';
    };

    frontend = lib.mkOption {
      type = lib.types.lines;
      default = ''
        ${pkgs.rofi}/bin/rofi -dmenu -p "Theme"
      '';
      defaultText = "rofi -dmenu -p Theme";
      description = "Command to display theme choices. Reads theme names from stdin, prints chosen name to stdout.";
    };

    themePackages = lib.mkOption {
      type = with lib.types; attrsOf package;
      readOnly = true;
      internal = true;
    };
  };

  config = lib.mkIf cfg.enable {
    nix-theme-switcher.themePackages = themePackages;

    environment.systemPackages = [switchScript listScript];

    /*
     * System-level (etc) symlinks for the default theme.
     * These are created by NixOS during rebuild and persist until
     * nix-theme-switch overrides them at runtime.
     */
    environment.etc = lib.optionalAttrs (defaultThemePkg != null) (
      lib.listToAttrs (lib.flatten (
        lib.mapAttrsToList (targetName: target: let
          etcFiles = lib.filter (file: file ? etc) target.files;
        in
          map (file: {
            name = file.etc;
            value = {source = "${defaultThemePkg}/etc/${file.etc}";};
          }) etcFiles
      ) activeTargets)
    ));
  };
}