{ pkgs, ... }:
let
  font = {
    package = pkgs.nerdfonts.override { fonts = [ "ProFont" ]; };
    name = "ProFont IIx Nerd Font";
    size = 16;
  };
in {
  home.packages = [ font.package ];
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.85;
      colors.draw_bold_text_with_bright_colors = true;
      font = {
        size = font.size;
        normal.family = font.name;
        bold.family = font.name;
        italic.family = font.name;
        bold_italic.family = font.name;
      };
      colors = {
        primary = {
          background = "0x000000";
          foreground = "0xdcd7ba";
        };
        cursor = {
          text = "0xff271d";
          cursor = "0xfbfcfc";
        };
        normal = {
          black = "0x090618";
          red = "0xc34043";
          green = "0x76946a";
          yellow = "0xc0a36e";
          blue = "0x7e9cd8";
          magenta = "0x957fb8";
          cyan = "0x6a9589";
          white = "0xc8c093";
        };
        bright = {
          black = "0x727169";
          red = "0xe82424";
          green = "0x98bb6c";
          yellow = "0xe6c384";
          blue = "0x7fb4ca";
          magenta = "0x938aa9";
          cyan = "0x7aa89f";
          white = "0xdcd7ba";
        };
        selection = {
          background = "0x2d4f67";
          foreground = "0xc8c093";
        };
      };
    };
  };
}
