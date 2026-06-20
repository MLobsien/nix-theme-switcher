{
  config,
  lib,
  hmConfigPath,
  ...
}: let
  # targets whose HM modules have mkRemovedOptionModule with apply=throw
  # injecting their full config into the inner eval forces these options, crashing eval
  badTargets = ["rofi" "vesktop"];
  hm = path: let
    name = builtins.elemAt path 1;
  in if lib.elem name badTargets then null
    else let r = builtins.tryEval (lib.attrByPath (hmConfigPath ++ path) null config);
    in if r.success then r.value else null;
  # helpers for common target patterns
  hmPgm = name: {base = ["programs" name]; enable = hm ["programs" name "enable"];};
  hmSvc = name: {base = ["services" name]; enable = hm ["services" name "enable"];};
  hmWm  = wm:  {base = ["wayland" "windowManager" wm]; enable = hm ["wayland" "windowManager" wm "enable"];};
  hmX11 = wm:  {base = ["xsession" "windowManager" wm]; enable = hm ["xsession" "windowManager" wm "enable"];};

  # always-on: injects basePath from outer config (or null if no base)
  always = base: {inherit base; enable = true;};

  external = name: hmPgm name // {external = true;};
in {
  # ── program targets ────────────────────────────────────────
  alacritty          = hmPgm "alacritty";
  anki               = hmPgm "anki";
  ashell             = hmPgm "ashell";
  bat                = hmPgm "bat";
  bemenu             = hmPgm "bemenu";
  broot              = hmPgm "broot";
  btop               = hmPgm "btop";
  cava               = hmPgm "cava";
  cavalier           = hmPgm "cavalier";
  dank-material-shell = external "dank-material-shell";
  emacs              = hmPgm "emacs";
  fish               = hmPgm "fish";
  floorp             = hmPgm "floorp";
  foliate            = hmPgm "foliate";
  foot               = hmPgm "foot";
  firefox            = hmPgm "firefox";
  fuzzel             = hmPgm "fuzzel";
  fzf                = hmPgm "fzf";
  ghostty            = hmPgm "ghostty";
  gitui              = hmPgm "gitui";
  halloy             = hmPgm "halloy";
  helix              = hmPgm "helix";
  hyprlock           = hmPgm "hyprlock";
  hyprpanel          = hmPgm "hyprpanel";
  i3bar-river        = hmPgm "i3bar-river";
  i3status-rust      = hmPgm "i3status-rust";
  jjui               = hmPgm "jjui";
  k9s                = hmPgm "k9s";
  kitty              = hmPgm "kitty";
  kubecolor          = hmPgm "kubecolor";
  lazygit            = hmPgm "lazygit";
  librewolf          = hmPgm "librewolf";
  mangohud           = hmPgm "mangohud";
  micro              = hmPgm "micro";
  mpv                = hmPgm "mpv";
  ncspot             = hmPgm "ncspot";
  neovide            = hmPgm "neovide";
  neovim             = hmPgm "neovim";
  nixcord            = external "nixcord";
  nixvim             = external "nixvim";
  noctalia-shell     = external "noctalia-shell";
  nushell            = hmPgm "nushell";
  nvf                = external "nvf";
  obsidian           = hmPgm "obsidian";
  opencode           = hmPgm "opencode";
  qutebrowser        = hmPgm "qutebrowser";
  rio                = hmPgm "rio";
  rofi               = hmPgm "rofi";
  sioyek             = hmPgm "sioyek";
  spicetify          = external "spicetify";
  spotify-player     = hmPgm "spotify-player";
  starship           = hmPgm "starship";
  swaylock           = hmPgm "swaylock";
  tmux               = hmPgm "tmux";
  tofi               = hmPgm "tofi";
  vesktop            = hmPgm "vesktop";
  vicinae            = hmPgm "vicinae";
  vim                = hmPgm "vim";
  vscode             = hmPgm "vscode";
  vscodium           = hmPgm "vscodium";
  waybar             = hmPgm "waybar";
  wayprompt          = hmPgm "wayprompt";
  wezterm            = hmPgm "wezterm";
  wofi               = hmPgm "wofi";
  yazi               = hmPgm "yazi";
  zathura            = hmPgm "zathura";
  zed                = hmPgm "zed-editor";
  zellij             = hmPgm "zellij";
  zen-browser        = external "zen-browser";

  # ── service targets ────────────────────────────────────────
  avizo    = hmSvc "avizo";
  dunst    = hmSvc "dunst";
  fnott    = hmSvc "fnott";
  glance   = hmSvc "glance";
  hyprpaper = hmSvc "hyprpaper";
  mako     = hmSvc "mako";
  swaync   = hmSvc "swaync";
  wob      = hmSvc "wob";
  wpaperd  = hmSvc "wpaperd";

  # ── wayland window managers ────────────────────────────────
  hyprland = hmWm "hyprland";
  river    = hmWm "river";
  sway     = hmWm "sway";
  wayfire  = hmWm "wayfire";

  # ── xsession window managers ───────────────────────────────
  bspwm = hmX11 "bspwm";
  i3    = hmX11 "i3";

  # ── special base paths ─────────────────────────────────────
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
  fontconfig = {
    base = ["fonts" "fontconfig"];
    enable = hm ["fonts" "fontconfig" "enable"];
  };
  gtk = {
    base = ["gtk"];
    enable = hm ["gtk" "enable"];
  };
  gtksourceview = {
    base = ["gtk"];
    enable = hm ["gtk" "enable"];
  };
  qt = {
    base = ["qt"];
    enable = hm ["qt" "enable"];
  };
  xresources = {
    base = ["xresources"];
    enable = true;
  };

  # ── always-on (null base, no injection needed) ─────────────
  blender           = always null;
  forge             = always null;
  gdu               = always null;
  gedit             = always null;
  font-packages     = always null;
  gnome             = always null;
  kde               = always null;
  gnome-text-editor = always null;
  sxiv              = always null;
  vencord           = always null;
  xfce              = always null;

  # ── explicitly disabled ────────────────────────────────────
  nixos-icons = {
    base = null;
    enable = false;
  };
}
