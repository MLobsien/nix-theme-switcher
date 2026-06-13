/*
 * nix-theme-switcher — Runtime theme switching for NixOS using stylix
 *
 * This entry point exposes two modules:
 *   nixosModules.default  — NixOS system-level module
 *   homeManagerModules.default — Home Manager user-level module
 *
 * The NixOS module:
 *   - Evaluates themes using lib.evalModules + stylix
 *   - Builds theme packages into the nix store
 *   - Creates the switching script with a compiled-in registry
 *   - Creates system-level (etc) symlinks for the default theme
 *
 * The Home Manager module (v1):
 *   - Defines shared options (enable, defaultTheme, targets)
 *   - Does NOT create xdg symlinks — stylix's own HM module handles the
 *     default theme. Runtime switching is done by the nix-theme-switch script.
 */
{stylix}: {
  nixosModules.default = import ./nixos.nix {inherit stylix;};
  homeManagerModules.default = import ./hm.nix;
}