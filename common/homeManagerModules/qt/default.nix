{ pkgs, ... }: {
  qt = {
    enable = true;
    style = {
      package = pkgs.libsForQt5.breeze-qt5;
      name = "breeze";
    };
  };
}
