let
  pgm = name: subpath: {
    enablePath = ["programs" name "enable"];
    srcPath = ["xdg" "configFile" subpath "source"];
    configFiles = ["$HOME/.config/${subpath}"];
  };
  svc = name: subpath: {
    enablePath = ["services" name "enable"];
    srcPath = ["xdg" "configFile" subpath "source"];
    configFiles = ["$HOME/.config/${subpath}"];
  };
  wm = wmname: subpath: {
    enablePath = ["wayland" "windowManager" wmname "enable"];
    srcPath = ["xdg" "configFile" subpath "source"];
    configFiles = ["$HOME/.config/${subpath}"];
  };
  x11 = wmname: subpath: {
    enablePath = ["xsession" "windowManager" wmname "enable"];
    srcPath = ["xdg" "configFile" subpath "source"];
    configFiles = ["$HOME/.config/${subpath}"];
  };
  pgmOnly = name: {
    enablePath = ["programs" name "enable"];
    srcPath = null;
    configFiles = [];
  };
  svcOnly = name: {
    enablePath = ["services" name "enable"];
    srcPath = null;
    configFiles = [];
  };
  always = {
    enablePath = null;
    srcPath = null;
    configFiles = [];
  };
  alwaysWithSrc = subpath: {
    enablePath = null;
    srcPath = ["xdg" "configFile" subpath "source"];
    configFiles = ["$HOME/.config/${subpath}"];
  };
in {
  alacritty          = pgm "alacritty" "alacritty/alacritty.toml";
  anki               = pgm "anki" "anki2/stylix.css";
  ashell             = pgm "ashell" "ascii-themes/stylix.json";
  avizo              = svc "avizo" "avizo/config.ini";
  bat                = {
    enablePath = ["programs" "bat" "enable"];
    srcPath = ["programs" "bat" "themes" "base16-stylix" "src"];
    configFiles = ["$HOME/.config/bat/themes/base16-stylix.tmTheme"];
  };
  bemenu             = pgm "bemenu" "bemenu/config";
  blender            = alwaysWithSrc "blender/4.2/scripts/presets/interface_theme/Stylix.xml";
  broot              = pgmOnly "broot";
  bspwm              = x11 "bspwm" "bspwm/bspwmrc" // {reload = "bspc wm --reload 2>/dev/null || true";};
  btop               = pgmOnly "btop";
  cava               = pgm "cava" "cava/config";
  cavalier           = pgm "cavalier" "cavalier/styles/stylix.json";
  dank-material-shell = pgmOnly "dank-material-shell";
  dunst              = svc "dunst" "dunst/dunstrc" // {reload = "killall dunst 2>/dev/null || true";};
  emacs              = pgm "emacs" "emacs/stylix.el";
  eog                = always;
  feh                = always;
  fcitx5 = {
    enablePath = ["i18n" "inputMethod" "enabled"];
    srcPath = ["xdg" "configFile" "fcitx5/themes/stylix" "source"];
    configFiles = ["$HOME/.config/fcitx5/themes/stylix"];
  };
  fish               = pgmOnly "fish";
  floorp             = pgmOnly "floorp";
  fnott              = svc "fnott" "fnott/fnott.ini";
  foliate            = pgm "foliate" "foliate/stylix.css";
  foot               = pgm "foot" "foot/foot.ini";
  forge = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "forge/stylesheet/forge/stylesheet.css" "source"];
    configFiles = ["$HOME/.config/forge/stylesheet/forge/stylesheet.css"];
  };
  firefox            = pgmOnly "firefox";
  fuzzel             = pgm "fuzzel" "fuzzel/fuzzel.ini";
  fzf                = pgmOnly "fzf";
  gdu = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "gdu/gdu.yaml" "source"];
    configFiles = ["$HOME/.config/gdu/gdu.yaml"];
  };
  gedit = {
    enablePath = null;
    srcPath = ["xdg" "dataFile" "gedit/styles/stylix.xml" "source"];
    configFiles = ["$HOME/.local/share/gedit/styles/stylix.xml"];
  };
  font-packages      = always;
  fontconfig = {
    enablePath = ["fonts" "fontconfig" "enable"];
    srcPath = null;
    configFiles = [];
  };
  ghostty            = pgm "ghostty" "ghostty/config";
  gitui              = pgm "gitui" "gitui/theme.ron";
  glance             = svc "glance" "glance/stylix.css";
  gnome = {
    enablePath = null;
    srcPath = ["xdg" "dataFile" "themes/Stylix/gnome-shell/gnome-shell.css" "source"];
    configFiles = [];
  };
  kde = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "kdeglobals" "source"];
    configFiles = ["$HOME/.config/kdeglobals"];
  };
  gnome-text-editor  = always;
  gtk = {
    enablePath = ["gtk" "enable"];
    srcPath = ["xdg" "configFile" "gtk-3.0/gtk.css" "source"];
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
    enablePath = ["gtk" "enable"];
    srcPath = ["xdg" "dataFile" "gtksourceview-4/styles/stylix.xml" "source"];
    configFiles = ["$HOME/.local/share/gtksourceview-4/styles/stylix.xml" "$HOME/.local/share/gtksourceview-5/styles/stylix.xml"];
  };
  halloy             = pgm "halloy" "halloy/themes/stylix.toml";
  helix = {
    enablePath = ["programs" "helix" "enable"];
    srcPath = null;
    configFiles = ["$HOME/.config/helix/themes/stylix.toml"];
  };
  hyprland           = wm "hyprland" "hypr/hyprland.conf" // {reload = "hyprctl reload 2>/dev/null || true";};
  hyprlock           = pgm "hyprlock" "hypr/hyprlock.conf";
  hyprpanel          = pgm "hyprpanel" "hyprpanel/config.json";
  hyprpaper          = svc "hyprpaper" "hypr/hyprpaper.conf" // {reload = "hyprctl reload 2>/dev/null || true";};
  i3                 = x11 "i3" "i3/config" // {reload = "i3-msg reload 2>/dev/null || true";};
  i3bar-river        = pgm "i3bar-river" "i3bar-river/config";
  i3status-rust      = pgm "i3status-rust" "i3status-rust/config.toml";
  jjui               = pgmOnly "jjui";
  k9s                = pgm "k9s" "k9s/skins/stylix.yaml";
  kitty              = pgm "kitty" "kitty/kitty.conf" // {reload = "killall -SIGUSR1 kitty 2>/dev/null || true";};
  kubecolor          = pgm "kubecolor" "kubecolor/config.yaml";
  lazygit = {
    enablePath = ["programs" "lazygit" "enable"];
    homeFileOf = { path = ["xdg" "configHome"]; suffix = "/lazygit/config.yml"; };
    configFiles = ["$HOME/.config/lazygit/config.yml"];
  };
  librewolf          = pgmOnly "librewolf";
  mako               = svc "mako" "mako/config" // {reload = "makoctl reload 2>/dev/null || true";};
  mangohud           = pgm "mangohud" "mangohud/MangoHud.conf";
  micro              = pgm "micro" "micro/colorschemes/stylix.micro";
  mpv                = pgm "mpv" "mpv/stylix.conf";
  ncspot             = pgm "ncspot" "ncspot/config.toml";
  nixos-icons        = always;
  neovide            = pgmOnly "neovide";
  neovim = {
    enablePath = ["programs" "neovim" "enable"];
    srcPath = ["xdg" "configFile" "nvim/stylix.lua" "source"];
    configFiles = ["$HOME/.config/nvim/stylix.lua"];
  };
  nixcord            = pgmOnly "nixcord";
  nixvim             = pgmOnly "nixvim";
  noctalia-shell = {
    enablePath = ["programs" "noctalia-shell" "enable"];
    srcPath = ["home" "file" ".cache/noctalia/wallpapers.json" "source"];
    configFiles = ["$HOME/.cache/noctalia/wallpapers.json"];
  };
  nushell = {
    enablePath = ["programs" "nushell" "enable"];
    homeFileOf = { path = ["programs" "nushell" "configDir"]; suffix = "/config.nu"; };
    configFiles = ["$HOME/.config/nushell/config.nu"];
  };
  nvf                = pgmOnly "nvf";
  obsidian           = pgmOnly "obsidian";
  opencode           = pgm "opencode" "opencode/themes/stylix.json";
  qt                 = pgm "qt" "Kvantum/kvantum.kvconfig";
  qutebrowser = {
    enablePath = ["programs" "qutebrowser" "enable"];
    homeFileOf = { path = ["xdg" "configHome"]; suffix = "/qutebrowser/config.py"; };
    configFiles = ["$HOME/.config/qutebrowser/config.py"];
  };
  rio                = pgm "rio" "rio/config.toml";
  river              = wm "river" "river/init";
  rofi = {
    enablePath = ["programs" "rofi" "enable"];
    homeFileOf = { path = ["programs" "rofi" "configPath"]; };
    configFiles = ["$HOME/.config/rofi/config.rasi"];
  };
  sioyek             = pgmOnly "sioyek";
  spicetify          = pgm "spicetify" "spicetify/stylix.json";
  spotify-player     = pgm "spotify-player" "spotify-player/config.toml";
  starship           = pgm "starship" "starship.toml";
  sway               = wm "sway" "sway/config" // {reload = "swaymsg reload 2>/dev/null || true";};
  swaylock           = pgm "swaylock" "swaylock/config";
  swaync             = svc "swaync" "swaync/style.css" // {reload = "swaync-client -R 2>/dev/null || true\nswaync-client -rs 2>/dev/null || true";};
  sxiv               = always;
  tmux               = pgm "tmux" "tmux/tmux.conf";
  tofi               = pgm "tofi" "tofi/config";
  vencord = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "Vencord/themes/stylix.theme.css" "source"];
    configFiles = ["$HOME/.config/Vencord/themes/stylix.theme.css"];
  };
  vesktop            = pgmOnly "vesktop";
  vicinae            = pgm "vicinae" "vicinae/themes/stylix.toml";
  vim                = pgmOnly "vim";
  vivid              = pgmOnly "vivid";
  vscode             = pgmOnly "vscode";
  vscodium           = pgmOnly "vscodium";
  waybar             = pgm "waybar" "waybar/style.css" // {reload = "pkill waybar 2>/dev/null || true";};
  wayfire            = wm "wayfire" "wayfire/wayfire.ini";
  wayprompt          = pgm "wayprompt" "wayprompt/config";
  wezterm            = pgm "wezterm" "wezterm/wezterm.lua";
  wob                = svc "wob" "wob/config";
  wofi               = pgm "wofi" "wofi/style.css";
  wpaperd            = svc "wpaperd" "wpaperd/config.toml";
  xresources = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "Xresources" "source"];
    configFiles = ["$HOME/.config/Xresources"];
    reload = ''
      xrdb -merge ~/.config/Xresources 2>/dev/null || true
    '';
  };
  xfce = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "xfce4/gtk.css" "source"];
    configFiles = ["$HOME/.config/xfce4/gtk.css"];
  };
  yazi               = pgm "yazi" "yazi/theme.toml";
  zathura            = pgm "zathura" "zathura/zathurarc";
  zed                = pgm "zed" "zed/themes/stylix.json";
  zellij             = pgm "zellij" "zellij/themes/stylix.json";
  zen-browser        = pgm "zen-browser" "zen-browser/stylix.css";
}
