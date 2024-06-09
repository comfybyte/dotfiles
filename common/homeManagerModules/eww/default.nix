{ pkgs, ... }: {
  home.packages = [ (pkgs.nerdfonts.override { fonts = [ "BigBlueTerminal" ]; }) ];
  programs.eww = {
    enable = true;
    configDir = ./config;
  };
}
