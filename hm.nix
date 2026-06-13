{lib, ...}: {
  imports = [(import ./options.nix {inherit lib;})];
}