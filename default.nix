{
  stylix,
  home-manager,
  hmConfigPath,
}: {
  options,
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nix-theme-switcher;

  inherit (lib) concatStringsSep concatStrings attrNames setAttrByPath attrByPath take flatten listToAttrs mapAttrsToList elemAt filter recursiveUpdate mkDefault;

  evalTheme = _: themeConfig: let
    allTargets = lib.mapAttrsToList (name: value: {inherit name value;})
      (import ./targets/input.nix {inherit config lib hmConfigPath;});

    # Pre-compute raw injection data per target (uses outer eval)
    targetInjects = map (target: let
      basePath = target.value.base;
      inject = basePath != null && target.value.enable != null && target.value.enable;
      optsVal = attrByPath (hmConfigPath ++ basePath) null options;
      doInject = if inject && target.value ? external then optsVal != null else inject;
    in {
      inherit basePath;
      value = if doInject then attrByPath (hmConfigPath ++ basePath) null config else null;
      optsVal = if doInject && target.value ? external then optsVal else null;
    }) allTargets;

    # Module function — runs inside inner eval with access to its options tree
    targetsConfig = { options, lib, ... }: let
      inherit (lib) attrByPath setAttrByPath mkDefault filterAttrs mapAttrs recursiveUpdate;

      # Recursively strip readOnly and removed option values
      filterRO = path: value: let
        r = builtins.tryEval (
          if !builtins.isAttrs value then value
          else
            let opt = attrByPath path null options; in
            if opt == null then null
            else if (opt._type or "") == "option" then
              if opt.readOnly or false || (opt.visible or true) == false
              then null
              else value
            else
              filterAttrs (n: v: v != null)
                (mapAttrs (n: v: filterRO (path ++ [n]) v) value)
        );
      in if r.success then r.value else null;
      configInjects = builtins.foldl' recursiveUpdate {} (map (inj:
        if inj.value == null then {}
        else setAttrByPath inj.basePath (mkDefault (filterRO inj.basePath inj.value))
      ) targetInjects);

      # Option declarations for external targets
      optionsInjects = builtins.foldl' recursiveUpdate {} (map (inj:
        if inj.optsVal != null then setAttrByPath (["options"] ++ inj.basePath) inj.optsVal else {}
      ) targetInjects);
    in {
      config = configInjects;
    } // optionsInjects;

    nixosEval = import "${pkgs.path}/nixos/lib/eval-config.nix" {
      inherit (pkgs.stdenv.hostPlatform) system;
      modules = [
        home-manager.nixosModules.home-manager
        {
          users.users.${cfg.user} = {};
          home-manager.users.${cfg.user} = {
            imports = [stylix.homeModules.stylix targetsConfig];
            home = {inherit (config.home-manager.users.${cfg.user}.home) stateVersion;};
            stylix = themeConfig // {enable = true;};
          };
        }
      ];
    };
  in
    nixosEval.config.home-manager.users.${cfg.user};
  targetPaths = import ./targets/output.nix;

  themes' = lib.mapAttrs evalTheme cfg.themes;

  applyTargetsForTheme = theme: let
    themeConfig = themes'.${theme};
  evalTarget = target: let
    hm = path: let
      r = builtins.tryEval (attrByPath path null themeConfig);
    in if r.success then r.value else null;
    fromHomeFile = let
      hf = target.homeFileOf or null;
    in if hf != null then
      let base = hm hf.path;
          key = if base != null then base + (hf.suffix or "") else null;
      in if key != null then hm (["home" "file" key "source"]) else null
    else null;
  in {
    enable = if target.enablePath != null then hm target.enablePath else true;
    dest = let fromSrc = if target.srcPath or null != null then hm target.srcPath else null;
    in if fromSrc != null then fromSrc else fromHomeFile;
    inherit (target) configFiles;
    reload = target.reload or "";
  };
    targetsForTheme = lib.mapAttrs (_: evalTarget) targetPaths // cfg.targets;
    allTargets = themeConfig.stylix.targets;
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
          concatStringsSep "\n" (filter (s: s != "") (map (file:
            if target.dest != null
            then "ln -sf ${target.dest} ${file}"
            else "")
          target.configFiles))
          + (let r = target.reload or ""; in if r != "" then "\n" + r else "")
      ))
      (list: concatStringsSep "\n" (filter (s: s != "") list))
    ]}
    ;;
  '';

  themeNames = attrNames themes';

  applyThemes = pkgs.writeShellScriptBin "nix-theme-switcher-apply" ''
    applyTheme() {
      case "$1" in
        ${concatStrings (map applyTargetsForTheme themeNames)}
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
        ${pkgs.rofi}/bin/rofi -dmenu
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

  # Force xdg.configFile entries managed by theme targets
  # so home-manager overwrites existing symlinks on rebuild
  config.home-manager.users.${cfg.user}.xdg.configFile = lib.mkIf cfg.enable (
    let
      isXDGConfig = p: p != null && take 2 p == ["xdg" "configFile"];
    in
    listToAttrs (flatten (mapAttrsToList (name: target:
      if isXDGConfig target.srcPath
      then [{ name = elemAt target.srcPath 2; value = { force = true; }; }]
      else []
    ) targetPaths))
  );
}
