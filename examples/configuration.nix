{
  pkgs,
  config,
  nixvim,
  ...
}: {
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

  home-manager.users.alice = {
    imports = [nixvim.homeManagerModules.nixvim];
    home.stateVersion = "24.11";
    programs.waybar.enable = true;
    programs.nixvim.enable = true;
    wayland.windowManager.hyprland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    rofi
    config.nix-theme-switcher.package
  ];

  nix-theme-switcher = {
    enable = true;
    user = "alice";
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
