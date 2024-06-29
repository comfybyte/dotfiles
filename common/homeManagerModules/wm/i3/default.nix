{ config, ... }: {
  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = ''
      bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
      bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
      bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
    '';
  };

  xsession.windowManager.i3.config = {
    modifier = "Mod4";
    keybindings = let
      mod = "Mod4";
      left = "h";
      right = "l";
      up = "k";
      down = "j";
      i3 = config.xsession.windowManager.i3.config;
    in {
      "${mod}+q" = "kill";
      "${mod}+Shift+c" = "reload";
      "${mod}+shift+q" = "exit";
      "${mod}+d" = "exec ${i3.menu}";

      "${mod}+f" = "fullscreen";
      "${mod}+Space" = "floating toggle";
      "${mod}+Shift+Space" = "focus mode_toggle";
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
      "${mod}+${up}" = "focus up";
      "${mod}+${right}" = "focus right";
      "${mod}+${down}" = "focus down";
      "${mod}+${left}" = "focus left";
      "${mod}+Shift+${up}" = "move up";
      "${mod}+Shift+${right}" = "move right";
      "${mod}+Shift+${down}" = "move down";
      "${mod}+Shift+${left}" = "move left";
    };
  };
}
