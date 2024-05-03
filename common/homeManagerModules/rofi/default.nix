{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    theme = "midnight_sky";
    terminal = "${pkgs.alacritty}/bin/alacritty";

    location = "bottom-right";
    xoffset = -8;
    yoffset = -32;
  };

  home.packages = [ (pkgs.nerdfonts.override { fonts = [ "UbuntuMono" ]; }) ];

  home.file.".local/share/rofi/themes/midnight_sky.rasi".text =
    import ./theme.nix;
}
