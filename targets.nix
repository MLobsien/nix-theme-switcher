{
  config,
  lib,
  user,
  ...
}: let
  inherit (lib) attrByPath;
  hm = path: attrByPath (["home-manager" "users" user] ++ path) null config;
  nixos = path: attrByPath path null config;
in {
  alacritty = {
    dest = hm ["xdg" "configFile" "alacritty/alacritty.toml" "source"];
    enable = hm ["programs" "alacritty" "enable"];
    configFiles = ["$HOME/.config/alacritty/alacritty.toml"];
  };

  anki = {
    dest = hm ["xdg" "configFile" "anki2/stylix.css" "source"];
    enable = hm ["programs" "anki" "enable"];
    configFiles = ["$HOME/.config/anki2/stylix.css"];
  };

  ashell = {
    dest = hm ["xdg" "dataFile" "ascii-themes/stylix.json" "source"];
    enable = hm ["programs" "ashell" "enable"];
    configFiles = ["$HOME/.local/share/ascii-themes/stylix.json"];
  };

  avizo = {
    dest = hm ["xdg" "configFile" "avizo/config.ini" "source"];
    enable = hm ["programs" "avizo" "enable"];
    configFiles = ["$HOME/.config/avizo/config.ini"];
  };

  bat = {
    dest = hm ["programs" "bat" "themes" "base16-stylix" "src"];
    enable = hm ["programs" "bat" "enable"];
    configFiles = ["$HOME/.config/bat/themes/base16-stylix.tmTheme"];
  };

  bemenu = {
    dest = hm ["xdg" "configFile" "bemenu/config" "source"];
    enable = hm ["programs" "bemenu" "enable"];
    configFiles = ["$HOME/.config/bemenu/config"];
  };

  blender = {
    dest = hm ["xdg" "configFile" "blender/4.2/scripts/presets/interface_theme/Stylix.xml" "source"];
    enable = hm ["programs" "blender" "enable"];
    configFiles = ["$HOME/.config/blender/4.2/scripts/presets/interface_theme/Stylix.xml"];
  };

  broot = {
    dest = hm ["xdg" "configFile" "broot/theme.toml" "source"];
    enable = hm ["programs" "broot" "enable"];
    configFiles = ["$HOME/.config/broot/theme.toml"];
  };

  bspwm = {
    dest = hm ["xdg" "configFile" "bspwm/bspwmrc" "source"];
    enable = hm ["programs" "bspwm" "enable"];
    configFiles = ["$HOME/.config/bspwm/bspwmrc"];
    reload = ''
      bspc wm --reload 2>/dev/null || true
    '';
  };

  btop = {
    dest = hm ["programs" "btop" "themes" "stylix"];
    enable = hm ["programs" "btop" "enable"];
    configFiles = [];
  };

  cava = {
    dest = hm ["xdg" "configFile" "cava/config" "source"];
    enable = hm ["programs" "cava" "enable"];
    configFiles = ["$HOME/.config/cava/config"];
  };

  cavalier = {
    dest = hm ["xdg" "configFile" "cavalier/styles/stylix.json" "source"];
    enable = hm ["programs" "cavalier" "enable"];
    configFiles = ["$HOME/.config/cavalier/styles/stylix.json"];
  };

  console = {
    dest = nixos [""];
    enable = nixos ["console" "enable"];
    configFiles = [];
  };

  chromium = {
    dest = nixos [""];
    enable = nixos ["programs" "chromium" "enable"];
    configFiles = [];
  };

  dank-material-shell = {
    dest = hm ["xdg" "dataFile" "gnome-shell/extensions/dank-material-shell/stylix.json" "source"];
    enable = hm ["gnome-shell" "extensions" "enable"];
    configFiles = ["$HOME/.local/share/gnome-shell/extensions/dank-material-shell/stylix.json"];
  };

  discord = {
    dest = hm ["xdg" "configFile" "discord/stylix.json" "source"];
    enable = hm ["programs" "discord" "enable"];
    configFiles = ["$HOME/.config/discord/stylix.json"];
  };

  dunst = {
    dest = hm ["xdg" "configFile" "dunst/dunstrc" "source"];
    enable = hm ["services" "dunst" "enable"];
    configFiles = ["$HOME/.config/dunst/dunstrc"];
    reload = ''
      killall dunst 2>/dev/null || true
    '';
  };

  emacs = {
    dest = hm ["xdg" "configFile" "emacs/stylix.el" "source"];
    enable = hm ["programs" "emacs" "enable"];
    configFiles = ["$HOME/.config/emacs/stylix.el"];
  };

  eog = {
    dest = hm ["dconf" "settings"];
    enable = hm ["programs" "eog" "enable"];
    configFiles = [];
  };

  fcitx5 = {
    dest = hm ["xdg" "configFile" "fcitx5/themes/stylix" "source"];
    enable = hm ["i18n" "inputMethod" "fcitx5" "enable"];
    configFiles = ["$HOME/.config/fcitx5/themes/stylix"];
  };

  feh = {
    dest = hm [""];
    enable = hm ["programs" "feh" "enable"];
    configFiles = [];
  };

  firefox = {
    dest = hm ["xdg" "configFile" "firefox/stylix.css" "source"];
    enable = hm ["programs" "firefox" "enable"];
    configFiles = [];
  };

  fish = {
    dest = hm ["programs" "fish" "interactiveShellInit"];
    enable = hm ["programs" "fish" "enable"];
    configFiles = [];
  };

  floorp = {
    dest = hm [""];
    enable = hm ["programs" "floorp" "enable"];
    configFiles = [];
  };

  fnott = {
    dest = hm ["xdg" "configFile" "fnott/fnott.ini" "source"];
    enable = hm ["programs" "fnott" "enable"];
    configFiles = ["$HOME/.config/fnott/fnott.ini"];
  };

  foliate = {
    dest = hm ["xdg" "configFile" "foliate/stylix.css" "source"];
    enable = hm ["programs" "foliate" "enable"];
    configFiles = ["$HOME/.config/foliate/stylix.css"];
  };

  fontconfig = {
    dest = nixos [""];
    enable = nixos ["fonts" "fontconfig" "enable"];
    configFiles = [];
  };

  font-packages = {
    dest = nixos [""];
    enable = nixos ["fonts" "enable"];
    configFiles = [];
  };

  foot = {
    dest = hm ["xdg" "configFile" "foot/foot.ini" "source"];
    enable = hm ["programs" "foot" "enable"];
    configFiles = ["$HOME/.config/foot/foot.ini"];
  };

  forge = {
    dest = hm ["xdg" "configFile" "forge/stylesheet/forge/stylesheet.css" "source"];
    enable = hm ["programs" "forge" "enable"];
    configFiles = ["$HOME/.config/forge/stylesheet/forge/stylesheet.css"];
  };

  fuzzel = {
    dest = hm ["xdg" "configFile" "fuzzel/fuzzel.ini" "source"];
    enable = hm ["programs" "fuzzel" "enable"];
    configFiles = ["$HOME/.config/fuzzel/fuzzel.ini"];
  };

  fzf = {
    dest = hm ["programs" "fzf" "colors"];
    enable = hm ["programs" "fzf" "enable"];
    configFiles = [];
  };

  gdu = {
    dest = hm ["xdg" "configFile" "gdu/gdu.yaml" "source"];
    enable = hm ["programs" "gdu" "enable"];
    configFiles = ["$HOME/.config/gdu/gdu.yaml"];
  };

  gedit = {
    dest = hm ["xdg" "dataFile" "gedit/styles/stylix.xml" "source"];
    enable = hm ["programs" "gedit" "enable"];
    configFiles = ["$HOME/.local/share/gedit/styles/stylix.xml"];
  };

  ghostty = {
    dest = hm ["xdg" "configFile" "ghostty/config" "source"];
    enable = hm ["programs" "ghostty" "enable"];
    configFiles = ["$HOME/.config/ghostty/config"];
  };

  gitui = {
    dest = hm ["xdg" "configFile" "gitui/theme.ron" "source"];
    enable = hm ["programs" "gitui" "enable"];
    configFiles = ["$HOME/.config/gitui/theme.ron"];
  };

  glance = {
    dest = hm ["xdg" "configFile" "glance/stylix.css" "source"];
    enable = hm ["programs" "glance" "enable"];
    configFiles = ["$HOME/.config/glance/stylix.css"];
  };

  gnome = {
    dest = hm ["xdg" "dataFile" "themes/Stylix/gnome-shell/gnome-shell.css" "source"];
    enable = nixos ["services" "xserver" "desktopManager" "gnome" "enable"];
    configFiles = [];
  };

  gnome-text-editor = {
    dest = hm [""];
    enable = hm [""];
    configFiles = [];
  };

  grub = {
    dest = nixos [""];
    enable = nixos ["boot" "loader" "grub" "enable"];
    configFiles = [];
  };

  gtk = {
    dest = hm ["xdg" "configFile" "gtk-3.0/gtk.css" "source"];
    enable = hm ["gtk" "enable"];
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
    enable = hm ["gtk" "enable"];
    configFiles = ["$HOME/.local/share/gtksourceview-4/styles/stylix.xml" "$HOME/.local/share/gtksourceview-5/styles/stylix.xml"];
  };

  halloy = {
    dest = hm ["xdg" "configFile" "halloy/themes/stylix.toml" "source"];
    enable = hm ["programs" "halloy" "enable"];
    configFiles = ["$HOME/.config/halloy/themes/stylix.toml"];
  };

  helix = {
    dest = hm ["programs" "helix" "themes" "stylix"];
    enable = hm ["programs" "helix" "enable"];
    configFiles = ["$HOME/.config/helix/themes/stylix.toml"];
  };

  hyprland = {
    dest = hm ["xdg" "configFile" "hypr/hyprland.conf" "source"];
    enable = hm ["programs" "hyprland" "enable"];
    configFiles = ["$HOME/.config/hypr/hyprland.conf"];
    reload = ''
      hyprctl reload 2>/dev/null || true
    '';
  };

  hyprlock = {
    dest = hm ["xdg" "configFile" "hypr/hyprlock.conf" "source"];
    enable = hm ["programs" "hyprlock" "enable"];
    configFiles = ["$HOME/.config/hypr/hyprlock.conf"];
  };

  hyprpanel = {
    dest = hm ["xdg" "configFile" "hyprpanel/config.json" "source"];
    enable = hm ["programs" "hyprpanel" "enable"];
    configFiles = ["$HOME/.config/hyprpanel/config.json"];
  };

  hyprpaper = {
    dest = hm ["xdg" "configFile" "hypr/hyprpaper.conf" "source"];
    enable = hm ["programs" "hyprpaper" "enable"];
    configFiles = ["$HOME/.config/hypr/hyprpaper.conf"];
    reload = ''
      hyprctl reload 2>/dev/null || true
    '';
  };

  i3 = {
    dest = hm ["xdg" "configFile" "i3/config" "source"];
    enable = hm ["programs" "i3" "enable"];
    configFiles = ["$HOME/.config/i3/config"];
    reload = ''
      i3-msg reload 2>/dev/null || true
    '';
  };

  i3bar-river = {
    dest = hm ["xdg" "configFile" "i3bar-river/config" "source"];
    enable = hm ["programs" "i3bar-river" "enable"];
    configFiles = ["$HOME/.config/i3bar-river/config"];
  };

  i3status-rust = {
    dest = hm ["xdg" "configFile" "i3status-rust/config.toml" "source"];
    enable = hm ["programs" "i3status-rust" "enable"];
    configFiles = ["$HOME/.config/i3status-rust/config.toml"];
  };

  jankyborders = {
    dest = hm [""];
    enable = hm ["programs" "jankyborders" "enable"];
    configFiles = [];
  };

  jjui = {
    dest = hm [""];
    enable = hm ["programs" "jjui" "enable"];
    configFiles = [];
  };

  k9s = {
    dest = hm ["xdg" "configFile" "k9s/skins/stylix.yaml" "source"];
    enable = hm ["programs" "k9s" "enable"];
    configFiles = ["$HOME/.config/k9s/skins/stylix.yaml"];
  };

  kde = {
    dest = hm ["xdg" "configFile" "kdeglobals" "source"];
    enable = nixos ["services" "desktopManager" "plasma6" "enable"];
    configFiles = ["$HOME/.config/kdeglobals"];
  };

  kitty = {
    dest = hm ["xdg" "configFile" "kitty/kitty.conf" "source"];
    enable = hm ["programs" "kitty" "enable"];
    configFiles = ["$HOME/.config/kitty/kitty.conf"];
    reload = ''
      killall -SIGUSR1 kitty 2>/dev/null || true
    '';
  };

  kmscon = {
    dest = nixos [""];
    enable = nixos ["services" "kmscon" "enable"];
    configFiles = [];
  };

  kubecolor = {
    dest = hm ["xdg" "configFile" "kubecolor/config.yaml" "source"];
    enable = hm ["programs" "kubecolor" "enable"];
    configFiles = ["$HOME/.config/kubecolor/config.yaml"];
  };

  lazygit = {
    dest = hm ["xdg" "configFile" "lazygit/config.yml" "source"];
    enable = hm ["programs" "lazygit" "enable"];
    configFiles = ["$HOME/.config/lazygit/config.yml"];
  };

  librewolf = {
    dest = hm [""];
    enable = hm ["programs" "librewolf" "enable"];
    configFiles = [];
  };

  lightdm = {
    dest = nixos [""];
    enable = nixos ["services" "displayManager" "lightdm" "enable"];
    configFiles = [];
  };

  limine = {
    dest = nixos [""];
    enable = nixos ["boot" "loader" "limine" "enable"];
    configFiles = [];
  };

  mako = {
    dest = hm ["xdg" "configFile" "mako/config" "source"];
    enable = hm ["services" "mako" "enable"];
    configFiles = ["$HOME/.config/mako/config"];
    reload = ''
      makoctl reload 2>/dev/null || true
    '';
  };

  mangohud = {
    dest = hm ["xdg" "configFile" "mangohud/MangoHud.conf" "source"];
    enable = hm ["programs" "mangohud" "enable"];
    configFiles = ["$HOME/.config/mangohud/MangoHud.conf"];
  };

  micro = {
    dest = hm ["xdg" "configFile" "micro/colorschemes/stylix.micro" "source"];
    enable = hm ["programs" "micro" "enable"];
    configFiles = ["$HOME/.config/micro/colorschemes/stylix.micro"];
  };

  mpv = {
    dest = hm ["xdg" "configFile" "mpv/stylix.conf" "source"];
    enable = hm ["programs" "mpv" "enable"];
    configFiles = ["$HOME/.config/mpv/stylix.conf"];
  };

  ncspot = {
    dest = hm ["xdg" "configFile" "ncspot/config.toml" "source"];
    enable = hm ["programs" "ncspot" "enable"];
    configFiles = ["$HOME/.config/ncspot/config.toml"];
  };

  neovide = {
    dest = hm [""];
    enable = hm ["programs" "neovide" "enable"];
    configFiles = [];
  };

  neovim = {
    dest = hm ["xdg" "configFile" "nvim/stylix.lua" "source"];
    enable = hm ["programs" "neovim" "enable"];
    configFiles = ["$HOME/.config/nvim/stylix.lua"];
  };

  nixcord = {
    dest = hm [""];
    enable = hm ["programs" "nixcord" "enable"];
    configFiles = [];
  };

  nixos-icons = {
    dest = nixos [""];
    enable = nixos ["stylix" "targets" "nixos-icons" "enable"];
    configFiles = [];
  };

  nixvim = {
    dest = hm [""];
    enable = hm ["programs" "nixvim" "enable"];
    configFiles = [];
  };

  noctalia-shell = {
    dest = hm ["xdg" "configFile" "noctalia/settings.json" "source"];
    enable = hm ["programs" "noctalia-shell" "enable"];
    configFiles = ["$HOME/.config/noctalia/settings.json"];
  };

  nushell = {
    dest = hm ["xdg" "configFile" "nushell/themes/stylix.nu" "source"];
    enable = hm ["programs" "nushell" "enable"];
    configFiles = ["$HOME/.config/nushell/themes/stylix.nu"];
  };

  nvf = {
    dest = hm [""];
    enable = hm ["programs" "nvf" "enable"];
    configFiles = [];
  };

  obsidian = {
    dest = hm ["xdg" "configFile" "obsidian/stylix.css" "source"];
    enable = hm ["programs" "obsidian" "enable"];
    configFiles = ["$HOME/.config/obsidian/stylix.css"];
  };

  opencode = {
    dest = hm ["xdg" "configFile" "opencode/themes/stylix.json" "source"];
    enable = hm ["programs" "opencode" "enable"];
    configFiles = ["$HOME/.config/opencode/themes/stylix.json"];
  };

  plymouth = {
    dest = nixos [""];
    enable = nixos ["boot" "plymouth" "enable"];
    configFiles = [];
  };

  qt = {
    dest = hm ["xdg" "configFile" "Kvantum/kvantum.kvconfig" "source"];
    enable = hm ["programs" "qt" "enable"];
    configFiles = ["$HOME/.config/Kvantum/kvantum.kvconfig" "$HOME/.config/Kvantum/Base16Kvantum"];
  };

  qutebrowser = {
    dest = hm ["xdg" "configFile" "qutebrowser/stylix.css" "source"];
    enable = hm ["programs" "qutebrowser" "enable"];
    configFiles = ["$HOME/.config/qutebrowser/stylix.css"];
  };

  regreet = {
    dest = hm ["xdg" "configFile" "regreet/stylix.css" "source"];
    enable = hm ["programs" "regreet" "enable"];
    configFiles = ["$HOME/.config/regreet/stylix.css"];
  };

  rio = {
    dest = hm ["xdg" "configFile" "rio/config.toml" "source"];
    enable = hm ["programs" "rio" "enable"];
    configFiles = ["$HOME/.config/rio/config.toml"];
  };

  river = {
    dest = hm ["xdg" "configFile" "river/init" "source"];
    enable = hm ["programs" "river" "enable"];
    configFiles = ["$HOME/.config/river/init"];
  };

  rofi = {
    dest = hm ["xdg" "configFile" "rofi/config.rasi" "source"];
    enable = hm ["programs" "rofi" "enable"];
    configFiles = ["$HOME/.config/rofi/config.rasi"];
  };

  sioyek = {
    dest = hm ["xdg" "configFile" "sioyek/prefs_user.config" "source"];
    enable = hm ["programs" "sioyek" "enable"];
    configFiles = ["$HOME/.config/sioyek/prefs_user.config"];
  };

  spicetify = {
    dest = hm ["xdg" "configFile" "spicetify/stylix.json" "source"];
    enable = hm ["programs" "spicetify" "enable"];
    configFiles = ["$HOME/.config/spicetify/stylix.json"];
  };

  spotify-player = {
    dest = hm ["xdg" "configFile" "spotify-player/config.toml" "source"];
    enable = hm ["programs" "spotify-player" "enable"];
    configFiles = ["$HOME/.config/spotify-player/config.toml"];
  };

  starship = {
    dest = hm ["xdg" "configFile" "starship.toml" "source"];
    enable = hm ["programs" "starship" "enable"];
    configFiles = ["$HOME/.config/starship.toml"];
  };

  sway = {
    dest = hm ["xdg" "configFile" "sway/config" "source"];
    enable = hm ["programs" "sway" "enable"];
    configFiles = ["$HOME/.config/sway/config"];
    reload = ''
      swaymsg reload 2>/dev/null || true
    '';
  };

  swaylock = {
    dest = hm ["xdg" "configFile" "swaylock/config" "source"];
    enable = hm ["programs" "swaylock" "enable"];
    configFiles = ["$HOME/.config/swaylock/config"];
  };

  swaync = {
    dest = hm ["xdg" "configFile" "swaync/style.css" "source"];
    enable = hm ["programs" "swaync" "enable"];
    configFiles = ["$HOME/.config/swaync/style.css"];
    reload = ''
      swaync-client -R 2>/dev/null || true
        swaync-client -rs 2>/dev/null || true
    '';
  };

  sxiv = {
    dest = hm ["xdg" "configFile" "sxiv/exec/keys" "source"];
    enable = hm ["programs" "sxiv" "enable"];
    configFiles = ["$HOME/.config/sxiv/exec/keys"];
  };

  tmux = {
    dest = hm ["xdg" "configFile" "tmux/tmux.conf" "source"];
    enable = hm ["programs" "tmux" "enable"];
    configFiles = ["$HOME/.config/tmux/tmux.conf"];
  };

  tofi = {
    dest = hm ["xdg" "configFile" "tofi/config" "source"];
    enable = hm ["programs" "tofi" "enable"];
    configFiles = ["$HOME/.config/tofi/config"];
  };

  vencord = {
    dest = hm [""];
    enable = hm ["programs" "vencord" "enable"];
    configFiles = [];
  };

  vesktop = {
    dest = hm [""];
    enable = hm ["programs" "vesktop" "enable"];
    configFiles = [];
  };

  vicinae = {
    dest = hm ["xdg" "configFile" "vicinae/themes/stylix.toml" "source"];
    enable = hm ["programs" "vicinae" "enable"];
    configFiles = ["$HOME/.config/vicinae/themes/stylix.toml"];
  };

  vim = {
    dest = hm [""];
    enable = hm ["programs" "vim" "enable"];
    configFiles = [];
  };

  vivid = {
    dest = hm ["xdg" "configFile" "vivid/themes/stylix.yaml" "source"];
    enable = hm ["programs" "vivid" "enable"];
    configFiles = ["$HOME/.config/vivid/themes/stylix.yaml"];
  };

  vscode = {
    dest = hm ["programs" "vscode" "profiles"];
    enable = hm ["programs" "vscode" "enable"];
    configFiles = [];
  };

  vscodium = {
    dest = hm [""];
    enable = hm ["programs" "vscodium" "enable"];
    configFiles = [];
  };

  waybar = {
    dest = hm ["xdg" "configFile" "waybar/style.css" "source"];
    enable = hm ["programs" "waybar" "enable"];
    configFiles = ["$HOME/.config/waybar/style.css"];
    reload = ''
      pkill waybar 2>/dev/null || true
    '';
  };

  wayfire = {
    dest = hm ["xdg" "configFile" "wayfire/wayfire.ini" "source"];
    enable = hm ["programs" "wayfire" "enable"];
    configFiles = ["$HOME/.config/wayfire/wayfire.ini"];
  };

  wayprompt = {
    dest = hm ["xdg" "configFile" "wayprompt/config" "source"];
    enable = hm ["programs" "wayprompt" "enable"];
    configFiles = ["$HOME/.config/wayprompt/config"];
  };

  wezterm = {
    dest = hm ["xdg" "configFile" "wezterm/wezterm.lua" "source"];
    enable = hm ["programs" "wezterm" "enable"];
    configFiles = ["$HOME/.config/wezterm/wezterm.lua"];
  };

  wob = {
    dest = hm ["xdg" "configFile" "wob/config" "source"];
    enable = hm ["programs" "wob" "enable"];
    configFiles = ["$HOME/.config/wob/config"];
  };

  wofi = {
    dest = hm ["xdg" "configFile" "wofi/style.css" "source"];
    enable = hm ["programs" "wofi" "enable"];
    configFiles = ["$HOME/.config/wofi/style.css"];
  };

  wpaperd = {
    dest = hm ["xdg" "configFile" "wpaperd/config.toml" "source"];
    enable = hm ["programs" "wpaperd" "enable"];
    configFiles = ["$HOME/.config/wpaperd/config.toml"];
  };

  xfce = {
    dest = hm ["xdg" "configFile" "xfce4/gtk.css" "source"];
    enable = nixos ["services" "xserver" "desktopManager" "xfce" "enable"];
    configFiles = ["$HOME/.config/xfce4/gtk.css"];
  };

  xresources = {
    dest = hm ["xdg" "configFile" "Xresources" "source"];
    enable = hm ["xresources" "enable"];
    configFiles = ["$HOME/.config/Xresources"];
    reload = ''
      xrdb -merge ~/.config/Xresources 2>/dev/null || true
    '';
  };

  yazi = {
    dest = hm ["xdg" "configFile" "yazi/theme.toml" "source"];
    enable = hm ["programs" "yazi" "enable"];
    configFiles = ["$HOME/.config/yazi/theme.toml"];
  };

  zathura = {
    dest = hm ["xdg" "configFile" "zathura/zathurarc" "source"];
    enable = hm ["programs" "zathura" "enable"];
    configFiles = ["$HOME/.config/zathura/zathurarc"];
  };

  zed = {
    dest = hm ["xdg" "configFile" "zed/themes/stylix.json" "source"];
    enable = hm ["programs" "zed" "enable"];
    configFiles = ["$HOME/.config/zed/themes/stylix.json"];
  };

  zellij = {
    dest = hm ["xdg" "configFile" "zellij/themes/stylix.json" "source"];
    enable = hm ["programs" "zellij" "enable"];
    configFiles = ["$HOME/.config/zellij/themes/stylix.json"];
  };

  zen-browser = {
    dest = hm ["xdg" "configFile" "zen-browser/stylix.css" "source"];
    enable = hm ["programs" "zen-browser" "enable"];
    configFiles = ["$HOME/.config/zen-browser/stylix.css"];
  };
}
# UNPROCESSED: []
# Processed 115 targets

