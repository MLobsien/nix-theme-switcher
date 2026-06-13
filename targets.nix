{lib}: let
  /*
   * Each target defines:
   *   files: list of { xdg = "..."; } or { etc = "..."; }
   *     xdg: path relative to ~/.config/
   *     etc: path relative to /etc/
   *   reload: shell commands to run after switching this target
   */
  targets = {
    gtk = {
      files = [
        {xdg = "gtk-3.0/gtk.css";}
        {xdg = "gtk-4.0/gtk.css";}
      ];
      reload = ''
        if command -v gsettings &>/dev/null; then
          CURRENT=$(gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null || echo "")
          if [ -n "$CURRENT" ]; then
            gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' 2>/dev/null || true
            sleep 0.05
            gsettings set org.gnome.desktop.interface gtk-theme "$CURRENT" 2>/dev/null || true
          fi
        fi
      '';
    };

    stylix-palette = {
      files = [
        {etc = "stylix/palette.json";}
        {etc = "stylix/palette.html";}
        {etc = "stylix/generated.json";}
      ];
      reload = "";
    };

    kitty = {
      files = [{xdg = "kitty/kitty.conf";}];
      reload = ''
        if command -v kitty &>/dev/null; then
          killall -SIGUSR1 kitty 2>/dev/null || true
        fi
      '';
    };

    foot = {
      files = [{xdg = "foot/foot.ini";}];
      reload = "";
    };

    alacritty = {
      files = [
        {xdg = "alacritty/alacritty.toml";}
        {xdg = "alacritty/alacritty.yml";}
      ];
      reload = "";
    };

    wezterm = {
      files = [
        {xdg = "wezterm/wezterm.lua";}
        {xdg = "wezterm/colors/";}
      ];
      reload = "";
    };

    ghostty = {
      files = [{xdg = "ghostty/config";}];
      reload = "";
    };

    rofi = {
      files = [{xdg = "rofi/config.rasi";}];
      reload = "";
    };

    waybar = {
      files = [{xdg = "waybar/style.css";}];
      reload = ''
        pkill waybar 2>/dev/null || true
      '';
    };

    dunst = {
      files = [{xdg = "dunst/dunstrc";}];
      reload = ''
        if command -v dunst &>/dev/null; then
          killall dunst 2>/dev/null || true
        fi
      '';
    };

    mako = {
      files = [{xdg = "mako/config";}];
      reload = ''
        if command -v makoctl &>/dev/null; then
          makoctl reload 2>/dev/null || true
        fi
      '';
    };

    fuzzel = {
      files = [{xdg = "fuzzel/fuzzel.ini";}];
      reload = "";
    };

    bat = {
      files = [{xdg = "bat/config";}];
      reload = "";
    };

    gitui = {
      files = [{xdg = "gitui/theme.ron";}];
      reload = "";
    };

    helix = {
      files = [{xdg = "helix/themes/";}];
      reload = "";
    };

    btop = {
      files = [{xdg = "btop/themes/";}];
      reload = "";
    };

    hyprland = {
      files = [{xdg = "hypr/hyprland.conf";}];
      reload = ''
        if command -v hyprctl &>/dev/null; then
          hyprctl reload 2>/dev/null || true
        fi
      '';
    };

    hyprlock = {
      files = [{xdg = "hypr/hyprlock.conf";}];
      reload = "";
    };

    hyprpaper = {
      files = [];
      reload = ''
        if command -v hyprctl &>/dev/null; then
          hyprctl reload 2>/dev/null || true
        fi
      '';
    };

    firefox = {
      files = [{xdg = "firefox/stylix.css";}];
      reload = "";
    };

    fish = {
      files = [{xdg = "fish/themes/stylix.theme";}];
      reload = "";
    };

    forge = {
      files = [{xdg = "forge/stylesheet/forge/stylesheet.css";}];
      reload = "";
    };
  };
in {
  inherit targets;

  /*
   * Flatten all target files into { name, type, path } entries.
   */
  allFiles = lib.concatLists (lib.mapAttrsToList (name: target:
    map (file: let
      type = if file ? xdg then "xdg" else "etc";
      path = file.${type};
    in {inherit name type path;}) target.files
  ) targets);

  /*
   * Generate reload commands for a list of target names.
   * Deduplicates and concatenates.
   */
  reloadCommandsFor = targetNames: lib.concatStringsSep "\n" (lib.unique (lib.filter (s: s != "") (
    map (name: targets.${name}.reload or "") targetNames
  )));
}