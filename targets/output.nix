{
  alacritty = {
    enablePath = ["programs" "alacritty" "enable"];
    srcPath = ["xdg" "configFile" "alacritty/alacritty.toml" "source"];
    configFiles = ["$HOME/.config/alacritty/alacritty.toml"];
  };

  anki = {
    enablePath = ["programs" "anki" "enable"];
    srcPath = ["xdg" "configFile" "anki2/stylix.css" "source"];
    configFiles = ["$HOME/.config/anki2/stylix.css"];
  };

  ashell = {
    enablePath = ["programs" "ashell" "enable"];
    srcPath = ["xdg" "dataFile" "ascii-themes/stylix.json" "source"];
    configFiles = ["$HOME/.local/share/ascii-themes/stylix.json"];
  };

  avizo = {
    enablePath = ["services" "avizo" "enable"];
    srcPath = ["xdg" "configFile" "avizo/config.ini" "source"];
    configFiles = ["$HOME/.config/avizo/config.ini"];
  };

  bat = {
    enablePath = ["programs" "bat" "enable"];
    srcPath = ["programs" "bat" "themes" "base16-stylix" "src"];
    configFiles = ["$HOME/.config/bat/themes/base16-stylix.tmTheme"];
  };

  bemenu = {
    enablePath = ["programs" "bemenu" "enable"];
    srcPath = ["xdg" "configFile" "bemenu/config" "source"];
    configFiles = ["$HOME/.config/bemenu/config"];
  };

  blender = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "blender/4.2/scripts/presets/interface_theme/Stylix.xml" "source"];
    configFiles = ["$HOME/.config/blender/4.2/scripts/presets/interface_theme/Stylix.xml"];
  };

  broot = {
    enablePath = ["programs" "broot" "enable"];
    srcPath = null;
    configFiles = [];
  };

  bspwm = {
    enablePath = ["xsession" "windowManager" "bspwm" "enable"];
    srcPath = ["xdg" "configFile" "bspwm/bspwmrc" "source"];
    configFiles = ["$HOME/.config/bspwm/bspwmrc"];
    reload = ''
      bspc wm --reload 2>/dev/null || true
    '';
  };

  btop = {
    enablePath = ["programs" "btop" "enable"];
    srcPath = null;
    configFiles = [];
  };

  cava = {
    enablePath = ["programs" "cava" "enable"];
    srcPath = ["xdg" "configFile" "cava/config" "source"];
    configFiles = ["$HOME/.config/cava/config"];
  };

  cavalier = {
    enablePath = ["programs" "cavalier" "enable"];
    srcPath = ["xdg" "configFile" "cavalier/styles/stylix.json" "source"];
    configFiles = ["$HOME/.config/cavalier/styles/stylix.json"];
  };

  dank-material-shell = {
    enablePath = ["programs" "dank-material-shell" "enable"];
    srcPath = null;
    configFiles = [];
  };

  dunst = {
    enablePath = ["services" "dunst" "enable"];
    srcPath = ["xdg" "configFile" "dunst/dunstrc" "source"];
    configFiles = ["$HOME/.config/dunst/dunstrc"];
    reload = ''
      killall dunst 2>/dev/null || true
    '';
  };

  emacs = {
    enablePath = ["programs" "emacs" "enable"];
    srcPath = ["xdg" "configFile" "emacs/stylix.el" "source"];
    configFiles = ["$HOME/.config/emacs/stylix.el"];
  };

  eog = {
    enablePath = null;
    srcPath = null;
    configFiles = [];
  };

  feh = {
    enablePath = null;
    srcPath = null;
    configFiles = [];
  };

  fcitx5 = {
    enablePath = ["i18n" "inputMethod" "enabled"];
    srcPath = ["xdg" "configFile" "fcitx5/themes/stylix" "source"];
    configFiles = ["$HOME/.config/fcitx5/themes/stylix"];
  };

  fish = {
    enablePath = ["programs" "fish" "enable"];
    srcPath = null;
    configFiles = [];
  };

  floorp = {
    enablePath = ["programs" "floorp" "enable"];
    srcPath = null;
    configFiles = [];
  };

  fnott = {
    enablePath = ["services" "fnott" "enable"];
    srcPath = ["xdg" "configFile" "fnott/fnott.ini" "source"];
    configFiles = ["$HOME/.config/fnott/fnott.ini"];
  };

  foliate = {
    enablePath = ["programs" "foliate" "enable"];
    srcPath = ["xdg" "configFile" "foliate/stylix.css" "source"];
    configFiles = ["$HOME/.config/foliate/stylix.css"];
  };

  foot = {
    enablePath = ["programs" "foot" "enable"];
    srcPath = ["xdg" "configFile" "foot/foot.ini" "source"];
    configFiles = ["$HOME/.config/foot/foot.ini"];
  };

  forge = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "forge/stylesheet/forge/stylesheet.css" "source"];
    configFiles = ["$HOME/.config/forge/stylesheet/forge/stylesheet.css"];
  };

  firefox = {
    enablePath = ["programs" "firefox" "enable"];
    srcPath = null;
    configFiles = [];
  };

  fuzzel = {
    enablePath = ["programs" "fuzzel" "enable"];
    srcPath = ["xdg" "configFile" "fuzzel/fuzzel.ini" "source"];
    configFiles = ["$HOME/.config/fuzzel/fuzzel.ini"];
  };

  fzf = {
    enablePath = ["programs" "fzf" "enable"];
    srcPath = null;
    configFiles = [];
  };

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

  font-packages = {
    enablePath = null;
    srcPath = null;
    configFiles = [];
  };

  fontconfig = {
    enablePath = ["fonts" "fontconfig" "enable"];
    srcPath = null;
    configFiles = [];
  };

  ghostty = {
    enablePath = ["programs" "ghostty" "enable"];
    srcPath = ["xdg" "configFile" "ghostty/config" "source"];
    configFiles = ["$HOME/.config/ghostty/config"];
  };

  gitui = {
    enablePath = ["programs" "gitui" "enable"];
    srcPath = ["xdg" "configFile" "gitui/theme.ron" "source"];
    configFiles = ["$HOME/.config/gitui/theme.ron"];
  };

  glance = {
    enablePath = ["services" "glance" "enable"];
    srcPath = ["xdg" "configFile" "glance/stylix.css" "source"];
    configFiles = ["$HOME/.config/glance/stylix.css"];
  };

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

  gnome-text-editor = {
    enablePath = null;
    srcPath = null;
    configFiles = [];
  };

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

  halloy = {
    enablePath = ["programs" "halloy" "enable"];
    srcPath = ["xdg" "configFile" "halloy/themes/stylix.toml" "source"];
    configFiles = ["$HOME/.config/halloy/themes/stylix.toml"];
  };

  helix = {
    enablePath = ["programs" "helix" "enable"];
    srcPath = null;
    configFiles = ["$HOME/.config/helix/themes/stylix.toml"];
  };

  hyprland = {
    enablePath = ["wayland" "windowManager" "hyprland" "enable"];
    srcPath = ["xdg" "configFile" "hypr/hyprland.conf" "source"];
    configFiles = ["$HOME/.config/hypr/hyprland.conf"];
    reload = ''
      hyprctl reload 2>/dev/null || true
    '';
  };

  hyprlock = {
    enablePath = ["programs" "hyprlock" "enable"];
    srcPath = ["xdg" "configFile" "hypr/hyprlock.conf" "source"];
    configFiles = ["$HOME/.config/hypr/hyprlock.conf"];
  };

  hyprpanel = {
    enablePath = ["programs" "hyprpanel" "enable"];
    srcPath = ["xdg" "configFile" "hyprpanel/config.json" "source"];
    configFiles = ["$HOME/.config/hyprpanel/config.json"];
  };

  hyprpaper = {
    enablePath = ["services" "hyprpaper" "enable"];
    srcPath = ["xdg" "configFile" "hypr/hyprpaper.conf" "source"];
    configFiles = ["$HOME/.config/hypr/hyprpaper.conf"];
    reload = ''
      hyprctl reload 2>/dev/null || true
    '';
  };

  i3 = {
    enablePath = ["xsession" "windowManager" "i3" "enable"];
    srcPath = ["xdg" "configFile" "i3/config" "source"];
    configFiles = ["$HOME/.config/i3/config"];
    reload = ''
      i3-msg reload 2>/dev/null || true
    '';
  };

  i3bar-river = {
    enablePath = ["programs" "i3bar-river" "enable"];
    srcPath = ["xdg" "configFile" "i3bar-river/config" "source"];
    configFiles = ["$HOME/.config/i3bar-river/config"];
  };

  i3status-rust = {
    enablePath = ["programs" "i3status-rust" "enable"];
    srcPath = ["xdg" "configFile" "i3status-rust/config.toml" "source"];
    configFiles = ["$HOME/.config/i3status-rust/config.toml"];
  };

  k9s = {
    enablePath = ["programs" "k9s" "enable"];
    srcPath = ["xdg" "configFile" "k9s/skins/stylix.yaml" "source"];
    configFiles = ["$HOME/.config/k9s/skins/stylix.yaml"];
  };

  kitty = {
    enablePath = ["programs" "kitty" "enable"];
    srcPath = ["xdg" "configFile" "kitty/kitty.conf" "source"];
    configFiles = ["$HOME/.config/kitty/kitty.conf"];
    reload = ''
      killall -SIGUSR1 kitty 2>/dev/null || true
    '';
  };

  kubecolor = {
    enablePath = ["programs" "kubecolor" "enable"];
    srcPath = ["xdg" "configFile" "kubecolor/config.yaml" "source"];
    configFiles = ["$HOME/.config/kubecolor/config.yaml"];
  };

  lazygit = {
    enablePath = ["programs" "lazygit" "enable"];
    srcPath = ["xdg" "configFile" "lazygit/config.yml" "source"];
    configFiles = ["$HOME/.config/lazygit/config.yml"];
  };

  jjui = {
    enablePath = ["programs" "jjui" "enable"];
    srcPath = null;
    configFiles = [];
  };

  librewolf = {
    enablePath = ["programs" "librewolf" "enable"];
    srcPath = null;
    configFiles = [];
  };

  mako = {
    enablePath = ["services" "mako" "enable"];
    srcPath = ["xdg" "configFile" "mako/config" "source"];
    configFiles = ["$HOME/.config/mako/config"];
    reload = ''
      makoctl reload 2>/dev/null || true
    '';
  };

  mangohud = {
    enablePath = ["programs" "mangohud" "enable"];
    srcPath = ["xdg" "configFile" "mangohud/MangoHud.conf" "source"];
    configFiles = ["$HOME/.config/mangohud/MangoHud.conf"];
  };

  micro = {
    enablePath = ["programs" "micro" "enable"];
    srcPath = ["xdg" "configFile" "micro/colorschemes/stylix.micro" "source"];
    configFiles = ["$HOME/.config/micro/colorschemes/stylix.micro"];
  };

  mpv = {
    enablePath = ["programs" "mpv" "enable"];
    srcPath = ["xdg" "configFile" "mpv/stylix.conf" "source"];
    configFiles = ["$HOME/.config/mpv/stylix.conf"];
  };

  ncspot = {
    enablePath = ["programs" "ncspot" "enable"];
    srcPath = ["xdg" "configFile" "ncspot/config.toml" "source"];
    configFiles = ["$HOME/.config/ncspot/config.toml"];
  };

  nixos-icons = {
    enablePath = null;
    srcPath = null;
    configFiles = [];
  };

  neovide = {
    enablePath = ["programs" "neovide" "enable"];
    srcPath = null;
    configFiles = [];
  };

  neovim = {
    enablePath = ["programs" "neovim" "enable"];
    srcPath = ["xdg" "configFile" "nvim/stylix.lua" "source"];
    configFiles = ["$HOME/.config/nvim/stylix.lua"];
  };

  nixcord = {
    enablePath = ["programs" "nixcord" "enable"];
    srcPath = null;
    configFiles = [];
  };

  nixvim = {
    enablePath = ["programs" "nixvim" "enable"];
    srcPath = null;
    configFiles = [];
  };

  noctalia-shell = {
    enablePath = ["programs" "noctalia-shell" "enable"];
    srcPath = ["home" "file" ".cache/noctalia/wallpapers.json" "source"];
    configFiles = ["$HOME/.cache/noctalia/wallpapers.json"];
  };

  nushell = {
    enablePath = ["programs" "nushell" "enable"];
    srcPath = ["xdg" "configFile" "nushell/themes/stylix.nu" "source"];
    configFiles = ["$HOME/.config/nushell/themes/stylix.nu"];
  };

  nvf = {
    enablePath = ["programs" "nvf" "enable"];
    srcPath = null;
    configFiles = [];
  };

  obsidian = {
    enablePath = ["programs" "obsidian" "enable"];
    srcPath = null;
    configFiles = [];
  };

  opencode = {
    enablePath = ["programs" "opencode" "enable"];
    srcPath = ["xdg" "configFile" "opencode/themes/stylix.json" "source"];
    configFiles = ["$HOME/.config/opencode/themes/stylix.json"];
  };

  qt = {
    enablePath = ["qt" "enable"];
    srcPath = ["xdg" "configFile" "Kvantum/kvantum.kvconfig" "source"];
    configFiles = ["$HOME/.config/Kvantum/kvantum.kvconfig" "$HOME/.config/Kvantum/Base16Kvantum"];
  };

  qutebrowser = {
    enablePath = ["programs" "qutebrowser" "enable"];
    srcPath = ["xdg" "configFile" "qutebrowser/stylix.css" "source"];
    configFiles = ["$HOME/.config/qutebrowser/stylix.css"];
  };

  rio = {
    enablePath = ["programs" "rio" "enable"];
    srcPath = ["xdg" "configFile" "rio/config.toml" "source"];
    configFiles = ["$HOME/.config/rio/config.toml"];
  };

  river = {
    enablePath = ["wayland" "windowManager" "river" "enable"];
    srcPath = ["xdg" "configFile" "river/init" "source"];
    configFiles = ["$HOME/.config/river/init"];
  };

  rofi = {
    enablePath = ["programs" "rofi" "enable"];
    srcPath = ["xdg" "configFile" "rofi/config.rasi" "source"];
    configFiles = ["$HOME/.config/rofi/config.rasi"];
  };

  sioyek = {
    enablePath = ["programs" "sioyek" "enable"];
    srcPath = null;
    configFiles = [];
  };

  spicetify = {
    enablePath = ["programs" "spicetify" "enable"];
    srcPath = ["xdg" "configFile" "spicetify/stylix.json" "source"];
    configFiles = ["$HOME/.config/spicetify/stylix.json"];
  };

  spotify-player = {
    enablePath = ["programs" "spotify-player" "enable"];
    srcPath = ["xdg" "configFile" "spotify-player/config.toml" "source"];
    configFiles = ["$HOME/.config/spotify-player/config.toml"];
  };

  starship = {
    enablePath = ["programs" "starship" "enable"];
    srcPath = ["xdg" "configFile" "starship.toml" "source"];
    configFiles = ["$HOME/.config/starship.toml"];
  };

  sway = {
    enablePath = ["wayland" "windowManager" "sway" "enable"];
    srcPath = ["xdg" "configFile" "sway/config" "source"];
    configFiles = ["$HOME/.config/sway/config"];
    reload = ''
      swaymsg reload 2>/dev/null || true
    '';
  };

  swaylock = {
    enablePath = ["programs" "swaylock" "enable"];
    srcPath = ["xdg" "configFile" "swaylock/config" "source"];
    configFiles = ["$HOME/.config/swaylock/config"];
  };

  swaync = {
    enablePath = ["services" "swaync" "enable"];
    srcPath = ["xdg" "configFile" "swaync/style.css" "source"];
    configFiles = ["$HOME/.config/swaync/style.css"];
    reload = ''
      swaync-client -R 2>/dev/null || true
      swaync-client -rs 2>/dev/null || true
    '';
  };

  sxiv = {
    enablePath = null;
    srcPath = null;
    configFiles = [];
  };

  tmux = {
    enablePath = ["programs" "tmux" "enable"];
    srcPath = ["xdg" "configFile" "tmux/tmux.conf" "source"];
    configFiles = ["$HOME/.config/tmux/tmux.conf"];
  };

  tofi = {
    enablePath = ["programs" "tofi" "enable"];
    srcPath = ["xdg" "configFile" "tofi/config" "source"];
    configFiles = ["$HOME/.config/tofi/config"];
  };

  vencord = {
    enablePath = null;
    srcPath = ["xdg" "configFile" "Vencord/themes/stylix.theme.css" "source"];
    configFiles = ["$HOME/.config/Vencord/themes/stylix.theme.css"];
  };

  vesktop = {
    enablePath = ["programs" "vesktop" "enable"];
    srcPath = null;
    configFiles = [];
  };

  vicinae = {
    enablePath = ["programs" "vicinae" "enable"];
    srcPath = ["xdg" "configFile" "vicinae/themes/stylix.toml" "source"];
    configFiles = ["$HOME/.config/vicinae/themes/stylix.toml"];
  };

  vim = {
    enablePath = ["programs" "vim" "enable"];
    srcPath = null;
    configFiles = [];
  };

  vivid = {
    enablePath = ["programs" "vivid" "enable"];
    srcPath = null;
    configFiles = [];
  };

  vscode = {
    enablePath = ["programs" "vscode" "enable"];
    srcPath = null;
    configFiles = [];
  };

  vscodium = {
    enablePath = ["programs" "vscodium" "enable"];
    srcPath = null;
    configFiles = [];
  };

  waybar = {
    enablePath = ["programs" "waybar" "enable"];
    srcPath = ["xdg" "configFile" "waybar/style.css" "source"];
    configFiles = ["$HOME/.config/waybar/style.css"];
    reload = ''
      pkill waybar 2>/dev/null || true
    '';
  };

  wayfire = {
    enablePath = ["wayland" "windowManager" "wayfire" "enable"];
    srcPath = ["xdg" "configFile" "wayfire/wayfire.ini" "source"];
    configFiles = ["$HOME/.config/wayfire/wayfire.ini"];
  };

  wayprompt = {
    enablePath = ["programs" "wayprompt" "enable"];
    srcPath = ["xdg" "configFile" "wayprompt/config" "source"];
    configFiles = ["$HOME/.config/wayprompt/config"];
  };

  wezterm = {
    enablePath = ["programs" "wezterm" "enable"];
    srcPath = ["xdg" "configFile" "wezterm/wezterm.lua" "source"];
    configFiles = ["$HOME/.config/wezterm/wezterm.lua"];
  };

  wob = {
    enablePath = ["services" "wob" "enable"];
    srcPath = ["xdg" "configFile" "wob/config" "source"];
    configFiles = ["$HOME/.config/wob/config"];
  };

  wofi = {
    enablePath = ["programs" "wofi" "enable"];
    srcPath = ["xdg" "configFile" "wofi/style.css" "source"];
    configFiles = ["$HOME/.config/wofi/style.css"];
  };

  wpaperd = {
    enablePath = ["services" "wpaperd" "enable"];
    srcPath = ["xdg" "configFile" "wpaperd/config.toml" "source"];
    configFiles = ["$HOME/.config/wpaperd/config.toml"];
  };

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

  yazi = {
    enablePath = ["programs" "yazi" "enable"];
    srcPath = ["xdg" "configFile" "yazi/theme.toml" "source"];
    configFiles = ["$HOME/.config/yazi/theme.toml"];
  };

  zathura = {
    enablePath = ["programs" "zathura" "enable"];
    srcPath = ["xdg" "configFile" "zathura/zathurarc" "source"];
    configFiles = ["$HOME/.config/zathura/zathurarc"];
  };

  zed = {
    enablePath = ["programs" "zed-editor" "enable"];
    srcPath = ["xdg" "configFile" "zed/themes/stylix.json" "source"];
    configFiles = ["$HOME/.config/zed/themes/stylix.json"];
  };

  zellij = {
    enablePath = ["programs" "zellij" "enable"];
    srcPath = ["xdg" "configFile" "zellij/themes/stylix.json" "source"];
    configFiles = ["$HOME/.config/zellij/themes/stylix.json"];
  };

  zen-browser = {
    enablePath = ["programs" "zen-browser" "enable"];
    srcPath = ["xdg" "configFile" "zen-browser/stylix.css" "source"];
    configFiles = ["$HOME/.config/zen-browser/stylix.css"];
  };
}
