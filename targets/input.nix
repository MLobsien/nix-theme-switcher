{
  config,
  lib,
  hmConfigPath,
  ...
}: let
  hm = path: lib.attrByPath (hmConfigPath ++ path) null config;
in {
  alacritty = {
    base = ["programs" "alacritty"];
    enable = hm ["programs" "alacritty" "enable"];
  };
  anki = {
    base = ["programs" "anki"];
    enable = hm ["programs" "anki" "enable"];
  };
  ashell = {
    base = ["programs" "ashell"];
    enable = hm ["programs" "ashell" "enable"];
  };
  avizo = {
    base = ["services" "avizo"];
    enable = hm ["services" "avizo" "enable"];
  };
  bat = {
    base = ["programs" "bat"];
    enable = hm ["programs" "bat" "enable"];
  };
  bemenu = {
    base = ["programs" "bemenu"];
    enable = hm ["programs" "bemenu" "enable"];
  };
  blender = {
    base = null;
    enable = true;
  };

  broot = {
    base = ["programs" "broot"];
    enable = hm ["programs" "broot" "enable"];
  };
  bspwm = {
    base = ["xsession" "windowManager" "bspwm"];
    enable = hm ["xsession" "windowManager" "bspwm" "enable"];
  };
  btop = {
    base = ["programs" "btop"];
    enable = hm ["programs" "btop" "enable"];
  };
  cava = {
    base = ["programs" "cava"];
    enable = hm ["programs" "cava" "enable"];
  };
  cavalier = {
    base = ["programs" "cavalier"];
    enable = hm ["programs" "cavalier" "enable"];
  };

  dank-material-shell = {
    external = true;
    base = ["programs" "dank-material-shell"];
    enable = hm ["programs" "dank-material-shell" "enable"];
  };
  dunst = {
    base = ["services" "dunst"];
    enable = hm ["services" "dunst" "enable"];
  };
  emacs = {
    base = ["programs" "emacs"];
    enable = hm ["programs" "emacs" "enable"];
  };
  eog = {
    base = ["dconf" "settings"];
    enable = true;
  };
  feh = {
    base = ["xsession" "initExtra"];
    enable = true;
  };
  fcitx5 = {
    base = ["i18n" "inputMethod"];
    enable = hm ["i18n" "inputMethod" "enabled"];
  };
  fish = {
    base = ["programs" "fish"];
    enable = hm ["programs" "fish" "enable"];
  };
  floorp = {
    base = ["programs" "floorp"];
    enable = hm ["programs" "floorp" "enable"];
  };
  fnott = {
    base = ["services" "fnott"];
    enable = hm ["services" "fnott" "enable"];
  };
  foliate = {
    base = ["programs" "foliate"];
    enable = hm ["programs" "foliate" "enable"];
  };
  foot = {
    base = ["programs" "foot"];
    enable = hm ["programs" "foot" "enable"];
  };

  firefox = {
    base = ["programs" "firefox"];
    enable = hm ["programs" "firefox" "enable"];
  };
  forge = {
    base = null;
    enable = true;
  };
  fuzzel = {
    base = ["programs" "fuzzel"];
    enable = hm ["programs" "fuzzel" "enable"];
  };
  fzf = {
    base = ["programs" "fzf"];
    enable = hm ["programs" "fzf" "enable"];
  };
  gdu = {
    base = null;
    enable = true;
  };
  gedit = {
    base = null;
    enable = true;
  };

  font-packages = {
    base = null;
    enable = true;
  };
  fontconfig = {
    base = ["fonts" "fontconfig"];
    enable = hm ["fonts" "fontconfig" "enable"];
  };
  ghostty = {
    base = ["programs" "ghostty"];
    enable = hm ["programs" "ghostty" "enable"];
  };
  gitui = {
    base = ["programs" "gitui"];
    enable = hm ["programs" "gitui" "enable"];
  };
  glance = {
    base = ["services" "glance"];
    enable = hm ["services" "glance" "enable"];
  };
  gnome = {
    base = null;
    enable = true;
  };
  kde = {
    base = null;
    enable = true;
  };
  gnome-text-editor = {
    base = null;
    enable = true;
  };
  gtk = {
    base = ["gtk"];
    enable = hm ["gtk" "enable"];
  };
  gtksourceview = {
    base = ["gtk"];
    enable = hm ["gtk" "enable"];
  };
  halloy = {
    base = ["programs" "halloy"];
    enable = hm ["programs" "halloy" "enable"];
  };
  helix = {
    base = ["programs" "helix"];
    enable = hm ["programs" "helix" "enable"];
  };
  hyprland = {
    base = ["wayland" "windowManager" "hyprland"];
    enable = hm ["wayland" "windowManager" "hyprland" "enable"];
  };
  hyprlock = {
    base = ["programs" "hyprlock"];
    enable = hm ["programs" "hyprlock" "enable"];
  };
  hyprpanel = {
    base = ["programs" "hyprpanel"];
    enable = hm ["programs" "hyprpanel" "enable"];
  };
  hyprpaper = {
    base = ["services" "hyprpaper"];
    enable = hm ["services" "hyprpaper" "enable"];
  };
  i3 = {
    base = ["xsession" "windowManager" "i3"];
    enable = hm ["xsession" "windowManager" "i3" "enable"];
  };
  i3bar-river = {
    base = ["programs" "i3bar-river"];
    enable = hm ["programs" "i3bar-river" "enable"];
  };
  i3status-rust = {
    base = ["programs" "i3status-rust"];
    enable = hm ["programs" "i3status-rust" "enable"];
  };
  k9s = {
    base = ["programs" "k9s"];
    enable = hm ["programs" "k9s" "enable"];
  };
  kitty = {
    base = ["programs" "kitty"];
    enable = hm ["programs" "kitty" "enable"];
  };
  kubecolor = {
    base = ["programs" "kubecolor"];
    enable = hm ["programs" "kubecolor" "enable"];
  };
  lazygit = {
    base = ["programs" "lazygit"];
    enable = hm ["programs" "lazygit" "enable"];
  };

  jjui = {
    base = ["programs" "jjui"];
    enable = hm ["programs" "jjui" "enable"];
  };
  librewolf = {
    base = ["programs" "librewolf"];
    enable = hm ["programs" "librewolf" "enable"];
  };
  mako = {
    base = ["services" "mako"];
    enable = hm ["services" "mako" "enable"];
  };
  mangohud = {
    base = ["programs" "mangohud"];
    enable = hm ["programs" "mangohud" "enable"];
  };
  micro = {
    base = ["programs" "micro"];
    enable = hm ["programs" "micro" "enable"];
  };
  mpv = {
    base = ["programs" "mpv"];
    enable = hm ["programs" "mpv" "enable"];
  };
  ncspot = {
    base = ["programs" "ncspot"];
    enable = hm ["programs" "ncspot" "enable"];
  };

  nixos-icons = {
    base = null;
    enable = false;
  };
  neovide = {
    base = ["programs" "neovide"];
    enable = hm ["programs" "neovide" "enable"];
  };
  neovim = {
    base = ["programs" "neovim"];
    enable = hm ["programs" "neovim" "enable"];
  };
  nixcord = {
    external = true;
    base = ["programs" "nixcord"];
    enable = hm ["programs" "nixcord" "enable"];
  };
  nixvim = {
    external = true;
    base = ["programs" "nixvim"];
    enable = hm ["programs" "nixvim" "enable"];
  };
  noctalia-shell = {
    external = true;
    base = ["programs" "noctalia-shell"];
    enable = hm ["programs" "noctalia-shell" "enable"];
  };
  nushell = {
    base = ["programs" "nushell"];
    enable = hm ["programs" "nushell" "enable"];
  };
  nvf = {
    external = true;
    base = ["programs" "nvf"];
    enable = hm ["programs" "nvf" "enable"];
  };
  obsidian = {
    base = ["programs" "obsidian"];
    enable = hm ["programs" "obsidian" "enable"];
  };
  opencode = {
    base = ["programs" "opencode"];
    enable = hm ["programs" "opencode" "enable"];
  };
  qt = {
    base = ["qt"];
    enable = hm ["qt" "enable"];
  };
  qutebrowser = {
    base = ["programs" "qutebrowser"];
    enable = hm ["programs" "qutebrowser" "enable"];
  };
  rio = {
    base = ["programs" "rio"];
    enable = hm ["programs" "rio" "enable"];
  };
  river = {
    base = ["wayland" "windowManager" "river"];
    enable = hm ["wayland" "windowManager" "river" "enable"];
  };
  rofi = {
    base = ["programs" "rofi"];
    enable = hm ["programs" "rofi" "enable"];
  };

  sioyek = {
    base = ["programs" "sioyek"];
    enable = hm ["programs" "sioyek" "enable"];
  };
  spicetify = {
    external = true;
    base = ["programs" "spicetify"];
    enable = hm ["programs" "spicetify" "enable"];
  };
  spotify-player = {
    base = ["programs" "spotify-player"];
    enable = hm ["programs" "spotify-player" "enable"];
  };
  starship = {
    base = ["programs" "starship"];
    enable = hm ["programs" "starship" "enable"];
  };
  sway = {
    base = ["wayland" "windowManager" "sway"];
    enable = hm ["wayland" "windowManager" "sway" "enable"];
  };
  swaylock = {
    base = ["programs" "swaylock"];
    enable = hm ["programs" "swaylock" "enable"];
  };
  swaync = {
    base = ["services" "swaync"];
    enable = hm ["services" "swaync" "enable"];
  };
  sxiv = {
    base = null;
    enable = true;
  };
  tmux = {
    base = ["programs" "tmux"];
    enable = hm ["programs" "tmux" "enable"];
  };
  tofi = {
    base = ["programs" "tofi"];
    enable = hm ["programs" "tofi" "enable"];
  };
  vencord = {
    base = null;
    enable = true;
  };
  vesktop = {
    base = ["programs" "vesktop"];
    enable = hm ["programs" "vesktop" "enable"];
  };
  vicinae = {
    base = ["programs" "vicinae"];
    enable = hm ["programs" "vicinae" "enable"];
  };
  vim = {
    base = ["programs" "vim"];
    enable = hm ["programs" "vim" "enable"];
  };
  vscode = {
    base = ["programs" "vscode"];
    enable = hm ["programs" "vscode" "enable"];
  };

  vscodium = {
    base = ["programs" "vscodium"];
    enable = hm ["programs" "vscodium" "enable"];
  };
  waybar = {
    base = ["programs" "waybar"];
    enable = hm ["programs" "waybar" "enable"];
  };
  wayfire = {
    base = ["wayland" "windowManager" "wayfire"];
    enable = hm ["wayland" "windowManager" "wayfire" "enable"];
  };
  wayprompt = {
    base = ["programs" "wayprompt"];
    enable = hm ["programs" "wayprompt" "enable"];
  };
  wezterm = {
    base = ["programs" "wezterm"];
    enable = hm ["programs" "wezterm" "enable"];
  };
  wob = {
    base = ["services" "wob"];
    enable = hm ["services" "wob" "enable"];
  };
  wofi = {
    base = ["programs" "wofi"];
    enable = hm ["programs" "wofi" "enable"];
  };
  wpaperd = {
    base = ["services" "wpaperd"];
    enable = hm ["services" "wpaperd" "enable"];
  };

  vivid = {
    base = ["programs" "vivid"];
    enable = hm ["programs" "vivid" "enable"];
  };
  xresources = {
    base = ["xresources"];
    enable = true;
  };
  xfce = {
    base = null;
    enable = true;
  };
  yazi = {
    base = ["programs" "yazi"];
    enable = hm ["programs" "yazi" "enable"];
  };
  zathura = {
    base = ["programs" "zathura"];
    enable = hm ["programs" "zathura" "enable"];
  };
  zed = {
    base = ["programs" "zed-editor"];
    enable = hm ["programs" "zed-editor" "enable"];
  };
  zellij = {
    base = ["programs" "zellij"];
    enable = hm ["programs" "zellij" "enable"];
  };
  zen-browser = {
    external = true;
    base = ["programs" "zen-browser"];
    enable = hm ["programs" "zen-browser" "enable"];
  };
}