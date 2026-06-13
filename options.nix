{lib}: let
  targetDefs = import ./targets.nix {inherit lib;};
in {
  options.nix-theme-switcher = {
    enable = lib.mkEnableOption "nix-theme-switcher";

    defaultTheme = lib.mkOption {
      type = lib.types.str;
      description = "Name of the default theme. Active after nixos-rebuild; runtime switching overrides it.";
      example = "\"nord\"";
    };

    targets = lib.mkOption {
      type = with lib.types; listOf str;
      default = lib.attrNames targetDefs.targets;
      defaultText = "All known targets";
      description = "List of target programs to manage symlinks for.";
      example = lib.literalExpression ''[ "gtk" "kitty" "waybar" ]'';
    };
  };
}