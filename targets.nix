{
  config,
  lib,
  ...
}: let
  inherit (lib) getAttrByPath;
  hm = path: getAttrByPath (["home-manager" "users" "stylix"] ++ path) config;
  nixos = path: getAttrByPath path config;
in {
  alacritty = {
    dest = hm ["xdg" "configFile" "alacritty/alacritty.toml" "source"];
    configFiles = ["$HOME/.config/alacritty/alacritty.toml"];
  };

  anki = {
    dest = hm ["xdg" "configFile" "anki2/stylix.css" "source"];
    configFiles = ["$HOME/.config/anki2/stylix.css"];
  };

  ashell = {
    dest = hm ["xdg" "dataFile" "ascii-themes/stylix.json" "source"];
    configFiles = ["$HOME/.local/share/ascii-themes/stylix.json"];
  };

  avizo = {
    dest = hm ["xdg" "configFile" "avizo/config.ini" "source"];
    configFiles = ["$HOME/.config/avizo/config.ini"];
  };

  bat = {
    dest = hm ["programs" "bat" "themes" "base16-stylix" "src"];
    configFiles = ["$HOME/.config/bat/themes/base16-stylix.tmTheme"];
  };

  bemenu = {
    dest = hm ["xdg" "configFile" "bemenu/config" "source"];
    configFiles = ["$HOME/.config/bemenu/config"];
  };

  blender = {
    dest = hm ["xdg" "configFile" "blender/4.2/scripts/presets/interface_theme/Stylix.xml" "source"];
    configFiles = ["$HOME/.config/blender/4.2/scripts/presets/interface_theme/Stylix.xml"];
  };

  bspwm = {
    dest = hm ["xdg" "configFile" "bspwm/bspwmrc" "source"];
    configFiles = ["$HOME/.config/bspwm/bspwmrc"];
    reload = ''
      bspc wm --reload 2>/dev/null || true
    '';
  };

  btop = {
    dest = hm ["programs" "btop" "themes" "stylix"];
    configFiles = [];
  };

  cava = {
    dest = hm ["xdg" "configFile" "cava/config" "source"];
    configFiles = ["$HOME/.config/cava/config"];
  };

  cavalier = {
    dest = hm ["xdg" "configFile" "cavalier/styles/stylix.json" "source"];
    configFiles = ["$HOME/.config/cavalier/styles/stylix.json"];
  };

  chromium = {
    dest = nixos [];
    configFiles = [];
  };

  discord = {
    dest = hm ["xdg" "configFile" "discord/stylix.json" "source"];
    configFiles = ["$HOME/.config/discord/stylix.json"];
  };

  dunst = {
    dest = hm ["xdg" "configFile" "dunst/dunstrc" "source"];
    configFiles = ["$HOME/.config/dunst/dunstrc"];
    reload = ''
      killall dunst 2>/dev/null || true
    '';
  };

  emacs = {
    dest = hm ["xdg" "configFile" "emacs/stylix.el" "source"];
    configFiles = ["$HOME/.config/emacs/stylix.el"];
  };

  eog = {
    dest = hm ["dconf" "settings"];
    configFiles = [];
  };

  fcitx5 = {
    dest = hm ["xdg" "configFile" "fcitx5/themes/stylix" "source"];
    configFiles = ["$HOME/.config/fcitx5/themes/stylix"];
  };

  feh = {
    dest = hm [];
    configFiles = [];
  };

  firefox = {
    dest = hm ["xdg" "configFile" "firefox/stylix.css" "source"];
    configFiles = [];
  };

  fish = {
    dest = hm ["programs" "fish" "interactiveShellInit"];
    configFiles = [];
  };

  fnott = {
    dest = hm ["xdg" "configFile" "fnott/fnott.ini" "source"];
    configFiles = ["$HOME/.config/fnott/fnott.ini"];
  };

  foliate = {
    dest = hm ["xdg" "configFile" "foliate/stylix.css" "source"];
    configFiles = ["$HOME/.config/foliate/stylix.css"];
  };

  fontconfig = {
    dest = nixos [];
    configFiles = [];
  };

  font-packages = {
    dest = nixos [];
    configFiles = [];
  };

  foot = {
    dest = hm ["xdg" "configFile" "foot/foot.ini" "source"];
    configFiles = ["$HOME/.config/foot/foot.ini"];
  };

  forge = {
    dest = hm ["xdg" "configFile" "forge/stylesheet/forge/stylesheet.css" "source"];
    configFiles = ["$HOME/.config/forge/stylesheet/forge/stylesheet.css"];
  };

  fuzzel = {
    dest = hm ["xdg" "configFile" "fuzzel/fuzzel.ini" "source"];
    configFiles = ["$HOME/.config/fuzzel/fuzzel.ini"];
  };

  fzf = {
    dest = hm ["programs" "fzf" "colors"];
    configFiles = [];
  };

  gdu = {
    dest = hm ["xdg" "configFile" "gdu/gdu.yaml" "source"];
    configFiles = ["$HOME/.config/gdu/gdu.yaml"];
  };

  gedit = {
    dest = hm ["xdg" "dataFile" "gedit/styles/stylix.xml" "source"];
    configFiles = ["$HOME/.local/share/gedit/styles/stylix.xml"];
  };

  ghostty = {
    dest = hm ["xdg" "configFile" "ghostty/config" "source"];
    configFiles = ["$HOME/.config/ghostty/config"];
  };

  gitui = {
    dest = hm ["xdg" "configFile" "gitui/theme.ron" "source"];
    configFiles = ["$HOME/.config/gitui/theme.ron"];
  };

  glance = {
    dest = hm ["xdg" "configFile" "glance/stylix.css" "source"];
    configFiles = ["$HOME/.config/glance/stylix.css"];
  };

  gnome = {
    dest = hm ["dconf" "settings"];
    configFiles = [];
  };

  gnome-text-editor = {
    dest = hm ["dconf" "settings"];
    configFiles = [];
  };

  gtk = {
    dest = hm ["xdg" "configFile" "gtk-3.0/gtk.css" "source"];
    configFiles = ["$HOME/.config/gtk-3.0/gtk.css" "$HOME/.config/gtk-4.0/gtk.css"];
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

  gtksourceview = {
    dest = hm ["xdg" "dataFile" "gtksourceview-4/styles/stylix.xml" "source"];
    configFiles = ["$HOME/.local/share/gtksourceview-4/styles/stylix.xml" "$HOME/.local/share/gtksourceview-5/styles/stylix.xml"];
  };

  halloy = {
    dest = hm ["xdg" "configFile" "halloy/themes/stylix.toml" "source"];
    configFiles = ["$HOME/.config/halloy/themes/stylix.toml"];
  };

  helix = {
    dest = hm ["programs" "helix" "themes" "stylix"];
    configFiles = ["$HOME/.config/helix/themes/stylix.toml"];
  };

  hyprland = {
    dest = hm ["xdg" "configFile" "hypr/hyprland.conf" "source"];
    configFiles = ["$HOME/.config/hypr/hyprland.conf"];
    reload = ''
      hyprctl reload 2>/dev/null || true
    '';
  };

  hyprlock = {
    dest = hm ["xdg" "configFile" "hypr/hyprlock.conf" "source"];
    configFiles = ["$HOME/.config/hypr/hyprlock.conf"];
  };

  hyprpanel = {
    dest = hm ["xdg" "configFile" "hyprpanel/config.json" "source"];
    configFiles = ["$HOME/.config/hyprpanel/config.json"];
  };

  hyprpaper = {
    dest = hm ["xdg" "configFile" "hypr/hyprpaper.conf" "source"];
    configFiles = ["$HOME/.config/hypr/hyprpaper.conf"];
    reload = ''
      hyprctl reload 2>/dev/null || true
    '';
  };

  i3 = {
    dest = hm ["xdg" "configFile" "i3/config" "source"];
    configFiles = ["$HOME/.config/i3/config"];
    reload = ''
      i3-msg reload 2>/dev/null || true
    '';
  };

  i3bar-river = {
    dest = hm ["xdg" "configFile" "i3bar-river/config" "source"];
    configFiles = ["$HOME/.config/i3bar-river/config"];
  };

  i3status-rust = {
    dest = hm ["xdg" "configFile" "i3status-rust/config.toml" "source"];
    configFiles = ["$HOME/.config/i3status-rust/config.toml"];
  };

  k9s = {
    dest = hm ["xdg" "configFile" "k9s/skins/stylix.yaml" "source"];
    configFiles = ["$HOME/.config/k9s/skins/stylix.yaml"];
  };

  kde = {
    dest = hm ["xdg" "configFile" "kdeglobals" "source"];
    configFiles = ["$HOME/.config/kdeglobals"];
  };

  kitty = {
    dest = hm ["xdg" "configFile" "kitty/kitty.conf" "source"];
    configFiles = ["$HOME/.config/kitty/kitty.conf"];
    reload = ''
      killall -SIGUSR1 kitty 2>/dev/null || true
    '';
  };

  kubecolor = {
    dest = hm ["xdg" "configFile" "kubecolor/config.yaml" "source"];
    configFiles = ["$HOME/.config/kubecolor/config.yaml"];
  };

  lazygit = {
    dest = hm ["xdg" "configFile" "lazygit/config.yml" "source"];
    configFiles = ["$HOME/.config/lazygit/config.yml"];
  };

  mako = {
    dest = hm ["xdg" "configFile" "mako/config" "source"];
    configFiles = ["$HOME/.config/mako/config"];
    reload = ''
      makoctl reload 2>/dev/null || true
    '';
  };

  mangohud = {
    dest = hm ["xdg" "configFile" "mangohud/MangoHud.conf" "source"];
    configFiles = ["$HOME/.config/mangohud/MangoHud.conf"];
  };

  micro = {
    dest = hm ["xdg" "configFile" "micro/colorschemes/stylix.micro" "source"];
    configFiles = ["$HOME/.config/micro/colorschemes/stylix.micro"];
  };

  mpv = {
    dest = hm ["xdg" "configFile" "mpv/stylix.conf" "source"];
    configFiles = ["$HOME/.config/mpv/stylix.conf"];
  };

  ncspot = {
    dest = hm ["xdg" "configFile" "ncspot/config.toml" "source"];
    configFiles = ["$HOME/.config/ncspot/config.toml"];
  };

  neovim = {
    dest = hm ["xdg" "configFile" "nvim/stylix.lua" "source"];
    configFiles = ["$HOME/.config/nvim/stylix.lua"];
  };

  noctalia-shell = {
    dest = hm ["xdg" "configFile" "noctalia/settings.json" "source"];
    configFiles = ["$HOME/.config/noctalia/settings.json"];
  };

  nushell = {
    dest = hm ["xdg" "configFile" "nushell/themes/stylix.nu" "source"];
    configFiles = ["$HOME/.config/nushell/themes/stylix.nu"];
  };

  obsidian = {
    dest = hm ["xdg" "configFile" "obsidian/stylix.css" "source"];
    configFiles = ["$HOME/.config/obsidian/stylix.css"];
  };

  opencode = {
    dest = hm ["xdg" "configFile" "opencode/themes/stylix.json" "source"];
    configFiles = ["$HOME/.config/opencode/themes/stylix.json"];
  };

  qt = {
    dest = hm ["xdg" "configFile" "Kvantum/kvantum.kvconfig" "source"];
    configFiles = ["$HOME/.config/Kvantum/kvantum.kvconfig" "$HOME/.config/Kvantum/Base16Kvantum"];
  };

  qutebrowser = {
    dest = hm ["xdg" "configFile" "qutebrowser/stylix.css" "source"];
    configFiles = ["$HOME/.config/qutebrowser/stylix.css"];
  };

  regreet = {
    dest = hm ["xdg" "configFile" "regreet/stylix.css" "source"];
    configFiles = ["$HOME/.config/regreet/stylix.css"];
  };

  rio = {
    dest = hm ["xdg" "configFile" "rio/config.toml" "source"];
    configFiles = ["$HOME/.config/rio/config.toml"];
  };

  river = {
    dest = hm ["xdg" "configFile" "river/init" "source"];
    configFiles = ["$HOME/.config/river/init"];
  };

  rofi = {
    dest = hm ["xdg" "configFile" "rofi/config.rasi" "source"];
    configFiles = ["$HOME/.config/rofi/config.rasi"];
  };

  spicetify = {
    dest = hm ["xdg" "configFile" "spicetify/stylix.json" "source"];
    configFiles = ["$HOME/.config/spicetify/stylix.json"];
  };

  spotify-player = {
    dest = hm ["xdg" "configFile" "spotify-player/config.toml" "source"];
    configFiles = ["$HOME/.config/spotify-player/config.toml"];
  };

  starship = {
    dest = hm ["xdg" "configFile" "starship.toml" "source"];
    configFiles = ["$HOME/.config/starship.toml"];
  };

  sway = {
    dest = hm ["xdg" "configFile" "sway/config" "source"];
    configFiles = ["$HOME/.config/sway/config"];
    reload = ''
      swaymsg reload 2>/dev/null || true
    '';
  };

  swaylock = {
    dest = hm ["xdg" "configFile" "swaylock/config" "source"];
    configFiles = ["$HOME/.config/swaylock/config"];
  };

  swaync = {
    dest = hm ["xdg" "configFile" "swaync/style.css" "source"];
    configFiles = ["$HOME/.config/swaync/style.css"];
    reload = ''
      swaync-client -R 2>/dev/null || true
        swaync-client -rs 2>/dev/null || true
    '';
  };

  sxiv = {
    dest = hm ["xdg" "configFile" "sxiv/exec/keys" "source"];
    configFiles = ["$HOME/.config/sxiv/exec/keys"];
  };

  tmux = {
    dest = hm ["xdg" "configFile" "tmux/tmux.conf" "source"];
    configFiles = ["$HOME/.config/tmux/tmux.conf"];
  };

  tofi = {
    dest = hm ["xdg" "configFile" "tofi/config" "source"];
    configFiles = ["$HOME/.config/tofi/config"];
  };

  vicinae = {
    dest = hm ["xdg" "configFile" "vicinae/themes/stylix.toml" "source"];
    configFiles = ["$HOME/.config/vicinae/themes/stylix.toml"];
  };

  vscode = {
    dest = hm ["programs" "vscode" "profiles"];
    configFiles = [];
  };

  waybar = {
    dest = hm ["xdg" "configFile" "waybar/style.css" "source"];
    configFiles = ["$HOME/.config/waybar/style.css"];
    reload = ''
      pkill waybar 2>/dev/null || true
    '';
  };

  wayfire = {
    dest = hm ["xdg" "configFile" "wayfire/wayfire.ini" "source"];
    configFiles = ["$HOME/.config/wayfire/wayfire.ini"];
  };

  wayprompt = {
    dest = hm ["xdg" "configFile" "wayprompt/config" "source"];
    configFiles = ["$HOME/.config/wayprompt/config"];
  };

  wezterm = {
    dest = hm ["xdg" "configFile" "wezterm/wezterm.lua" "source"];
    configFiles = ["$HOME/.config/wezterm/wezterm.lua"];
  };

  wob = {
    dest = hm ["xdg" "configFile" "wob/config" "source"];
    configFiles = ["$HOME/.config/wob/config"];
  };

  wofi = {
    dest = hm ["xdg" "configFile" "wofi/style.css" "source"];
    configFiles = ["$HOME/.config/wofi/style.css"];
  };

  wpaperd = {
    dest = hm ["xdg" "configFile" "wpaperd/config.toml" "source"];
    configFiles = ["$HOME/.config/wpaperd/config.toml"];
  };

  xfce = {
    dest = hm ["xdg" "configFile" "xfce4/gtk.css" "source"];
    configFiles = ["$HOME/.config/xfce4/gtk.css"];
  };

  xresources = {
    dest = hm ["xdg" "configFile" "Xresources" "source"];
    configFiles = ["$HOME/.config/Xresources"];
    reload = ''
      xrdb -merge ~/.config/Xresources 2>/dev/null || true
    '';
  };

  yazi = {
    dest = hm ["xdg" "configFile" "yazi/theme.toml" "source"];
    configFiles = ["$HOME/.config/yazi/theme.toml"];
  };

  zathura = {
    dest = hm ["xdg" "configFile" "zathura/zathurarc" "source"];
    configFiles = ["$HOME/.config/zathura/zathurarc"];
  };

  zed = {
    dest = hm ["xdg" "configFile" "zed/themes/stylix.json" "source"];
    configFiles = ["$HOME/.config/zed/themes/stylix.json"];
  };

  zellij = {
    dest = hm ["xdg" "configFile" "zellij/themes/stylix.json" "source"];
    configFiles = ["$HOME/.config/zellij/themes/stylix.json"];
  };

  zen-browser = {
    dest = hm ["xdg" "configFile" "zen-browser/stylix.css" "source"];
    configFiles = ["$HOME/.config/zen-browser/stylix.css"];
  };
}

