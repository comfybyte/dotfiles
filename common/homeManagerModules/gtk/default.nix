{ pkgs, ... }: {
  xdg.enable = true;

  gtk = {
    enable = true;

    theme = {
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "rosewater" ];
        tweaks = [ "black" ];
      };
      name = "Catppuccin-Mocha-Standard-Rosewater-Dark";
    };

    iconTheme = {
      name = "rose-pine-moon";
      package = pkgs.rose-pine-icon-theme;
    };

    font = {
      package = pkgs.nerdfonts.override { fonts = [ "Ubuntu" ]; };
      name = "Ubuntu Nerd Font";
      size = 16;
    };
  };
}
