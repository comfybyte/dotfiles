{ pkgs, ... }: {
  home.packages = [ (pkgs.nerdfonts.override { fonts = [ "UbuntuMono" ]; }) ];
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = import ./style.nix;
    systemd.target = "sway-session.target";
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [ "sway/workspaces" ];
        modules-right = [
          "tray"
          "network"
          "cpu"
          "memory"
          "temperature"
          "pulseaudio"
          "clock"
        ];

        "wlr/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
        };
        clock = {
          interval = 1;
          format = "{:%a, %e %b @ %H:%M:%S}";
        };
        cpu = {
          interval = 5;
          format = "CPU {usage}%";
          states = {
            warning = 70;
            critical = 90;
          };
        };
        memory = {
          interval = 5;
          format = "MEM {}%";
          states = {
            warning = 70;
            critical = 90;
          };
        };
        pulseaudio = {
          scroll-step = 1;
          format = "VOL {volume}%";
          format-muted = "MUT {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";

          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+";
        };
        temperature = {
          thermal-zone = 1;
          hwmon-path = "/sys/class/hwmon/hwmon0/temp1_input";
          critical-treshold = 70;
          format = "{temperatureC}°C";
          format-critical = "{temperatureC}°C!";
          interval = 60;
        };
        network = {
          interface = "enp2s0";
          interval = 4;
          format = "  {bandwidthDownBytes}   {bandwidthUpBytes}";
        };
        tray = {
          icon-size = 15;
          spacing = 10;
        };
      };
    };
  };
}
