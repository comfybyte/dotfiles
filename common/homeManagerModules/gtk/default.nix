{ pkgs, inputs, system, ... }:
let
  theme = {
    pkg = pkgs.rose-pine-gtk-theme;
    name = "rose-pine";
  };
  icon = {
    pkg = pkgs.rose-pine-icon-theme;
    name = "rose-pine";
  };
in {
  home.sessionVariables.GTK_THEME = theme.name;
  gtk = {
    enable = true;
    # iconTheme = {
    #   name = icon.name;
    #   package = icon.pkg;
    # };
    # theme = {
    #   name = theme.name;
    #   package = theme.pkg;
    # };
    font = {
      package = inputs.extra.packages.${system}.zpix-pixel-nerd-font;
      name = "Zpix Nerd Font";
      size = 16;
    };
  };
}
