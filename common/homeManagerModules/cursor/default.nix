{ pkgs, ... }: {
  home.pointerCursor = {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    gtk.enable = true;
    x11.enable = true;
  };
}
