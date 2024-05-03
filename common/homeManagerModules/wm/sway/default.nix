{ pkgs, inputs, system, ... }:
let
  terminal = "${pkgs.alacritty}/bin/alacritty";
  launcher = "${pkgs.rofi}/bin/rofi -show run";
  file_browser = "${pkgs.cinnamon.nemo-with-extensions}/bin/nemo";
  status_bar = "${pkgs.waybar}/bin/waybar";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  screenshot = let extra = inputs.extra.packages.${system};
  in {
    screen = "${extra.sshot}/bin/sshot --screen -o $HOME/imgs/screenshots";
    area = "${extra.sshot}/bin/sshot --area -o $HOME/imgs/screenshots";
  };
in {
  imports = [ ./waybar ];

  home.packages = with pkgs; [ swww ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;

    config = {
      inherit terminal;
      input."type:keyboard".xkb_layout = "br";
      defaultWorkspace = "workspace 1";
      window.titlebar = false;

      bars = [{
        command = status_bar;
        position = "bottom"; # necessário porquê o default é `null`.
        mode = "dock";
      }];

      floating = {
        border = 1;
        titlebar = false;
      };

      gaps = {
        inner = 0;
        outer = 0;
        smartBorders = "on";
      };

      # Docs: (https://man.archlinux.org/man/sway.5.en#CRITERIA)
      assigns = {
        "1" = [{ class = "Alacritty"; }];
        "2" = [ { class = "Firefox"; } { class = "Floorp"; } ];
        "3" = [{ class = "nemo"; }];
        "5" = [{ class = "discord"; }];
        "6" = [{ class = "Krita"; }];
        "7" = [ { title = "Steam"; } { title = "Lutris"; } ];
        "9" = [{ title = "Obsidian"; }];
      };

      keybindings = let
        mod = "Mod4";
        left = "h";
        right = "l";
        up = "k";
        down = "j";

        controlBinds = {
          "${mod}+q" = "kill";
          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+q" = "exit";
        };
        layoutBinds = {
          "${mod}+t" = "layout default";

          "${mod}+f" = "fullscreen";
          "${mod}+Space" = "floating toggle";
          "${mod}+Shift+Space" = "focus mode_toggle";
        };
        appBinds = {
          "${mod}+Return" = "exec ${terminal}";
          "${mod}+d" = "exec ${launcher}";
          "${mod}+n" = "exec ${file_browser}";
          "Print" = "exec ${screenshot.screen}";
          "Shift+Print" = "exec ${screenshot.area}";

          "XF86AudioPlay" = "exec ${playerctl} play";
          "XF86AudioPause" = "exec ${playerctl} pause";
          "XF86AudioNext" = "exec ${playerctl} next";
          "XF86AudioPrev" = "exec ${playerctl} previous";
        };
        workspaceBinds = {
          switch = {
            "${mod}+1" = "workspace 1";
            "${mod}+2" = "workspace 2";
            "${mod}+3" = "workspace 3";
            "${mod}+4" = "workspace 4";
            "${mod}+5" = "workspace 5";
            "${mod}+6" = "workspace 6";
            "${mod}+7" = "workspace 7";
            "${mod}+8" = "workspace 8";
            "${mod}+9" = "workspace 9";
            "${mod}+0" = "workspace 10";
          };
          move = {
            "${mod}+Shift+1" = "move container to workspace 1";
            "${mod}+Shift+2" = "move container to workspace 2";
            "${mod}+Shift+3" = "move container to workspace 3";
            "${mod}+Shift+4" = "move container to workspace 4";
            "${mod}+Shift+5" = "move container to workspace 5";
            "${mod}+Shift+6" = "move container to workspace 6";
            "${mod}+Shift+7" = "move container to workspace 7";
            "${mod}+Shift+8" = "move container to workspace 8";
            "${mod}+Shift+9" = "move container to workspace 9";
            "${mod}+Shift+0" = "move container to workspace 10";
          };
          focus = {
            "${mod}+${up}" = "focus up";
            "${mod}+${right}" = "focus right";
            "${mod}+${down}" = "focus down";
            "${mod}+${left}" = "focus left";
          };
          shift = {
            "${mod}+Shift+${up}" = "move up";
            "${mod}+Shift+${right}" = "move right";
            "${mod}+Shift+${down}" = "move down";
            "${mod}+Shift+${left}" = "move left";
          };
        };
      in controlBinds // layoutBinds // appBinds // workspaceBinds.move
      // workspaceBinds.switch // workspaceBinds.focus // workspaceBinds.shift;

      startup = [
        { command = "${pkgs.swww}/bin/swww init"; }
        {
          command = terminal;
        }
        # Rodar direto do `pkgs.fcitx5` não lê os addons.
        { command = "fcitx5"; }
        { command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"; }
        { command = "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"; }
      ];
    };
    extraConfig = ''
      for_window [window_role="pop-up"] floating enable
      for_window [window_role="bubble"] floating enable
      for_window [window_role="task_dialog"] floating enable
      for_window [window_role="Preferences"] floating enable
      for_window [window_type="dialog"] floating enable
      for_window [window_type="menu"] floating enable
      for_window [window_role="About"] floating enable
      for_window [title="Save File"] floating enable
    '';
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-mozc
      fcitx5-hangul
      libsForQt5.fcitx5-qt
    ];
  };
}
