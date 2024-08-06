# see: https://github.com/YaLTeR/niri
{ pkgs, lib, unstable, ... }:
let
  enableWaybar = false;
  terminal = {
    cmd = "alacritty";
    package = pkgs.alacritty;
  };
  launcher = {
    cmd = "fuzzel";
    package = pkgs.fuzzel;
  };
  fileBrowser = {
    cmd = "nemo";
    package = unstable.nemo-with-extensions;
  };
  notifications = {
    cmd = "cosmic-notifications";
    package = unstable.cosmic-notifications;
  };
in {
  imports = lib.optional enableWaybar ./waybar;

  home.packages = [
    pkgs.niri
    terminal.package
    launcher.package
    fileBrowser.package
    notifications.package
  ];

  home.file.".config/niri/config.kdl".text = ''
      spawn-at-startup "${notifications.cmd}"
      spawn-at-startup "${terminal.cmd}"
      spawn-at-startup "swww-daemon"
      spawn-at-startup "eww daemon"
      spawn-at-startup "fcitx5"
      ${lib.optionalString enableWaybar ''spawn-at-startup "waybar"''}

      prefer-no-csd // begone, decorations.

      screenshot-path "~/imgs/screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

      environment {
        QT_QPA_PLATFORM "wayland"
        SDL_VIDEODRIVER "wayland"
      }

      input {
        keyboard {
          xkb {
            layout "br"
          }
        }
      }

      layout {
        gaps 0
        default-column-width { proportion 1.0; }
        border { off; }
        focus-ring { off; }
      }

      binds {
        Mod+Return { spawn "${terminal.cmd}"; }
        Mod+D { spawn "${launcher.cmd}"; }
        Mod+N { spawn "${fileBrowser.cmd}"; }

        Mod+B { spawn "eww" "open" "--toggle" "sysmon"; }

        XF86AudioRaiseVolume { spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "+4%"; }
        XF86AudioLowerVolume { spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "-4%"; }

        Mod+Q { close-window; }

        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }
        Mod+H     { focus-column-left; }
        Mod+J     { focus-window-down; }
        Mod+K     { focus-window-up; }
        Mod+L     { focus-column-right; }

        Mod+Shift+Left  { move-column-left; }
        Mod+Shift+Down  { move-window-down; }
        Mod+Shift+Up    { move-window-up; }
        Mod+Shift+Right { move-column-right; }
        Mod+Shift+H     { move-column-left; }
        Mod+Shift+J     { move-window-down; }
        Mod+Shift+K     { move-window-up; }
        Mod+Shift+L     { move-column-right; }

        Mod+Home { focus-column-first; }
        Mod+End  { focus-column-last; }
        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+End  { move-column-to-last; }

        Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

        Mod+Page_Down      { focus-workspace-down; }
        Mod+Page_Up        { focus-workspace-up; }
        Mod+U              { focus-workspace-down; }
        Mod+I              { focus-workspace-up; }
        Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
        Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
        Mod+Ctrl+U         { move-column-to-workspace-down; }
        Mod+Ctrl+I         { move-column-to-workspace-up; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }

        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
        Mod+C { center-column; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }

        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        Mod+Shift+Q { quit; }
    }
  '';
}
