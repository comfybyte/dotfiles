{ inputs, ... }: {
  imports = with inputs.self.homeManagerModules; [
    alacritty
    cursor
    git
    gpg
    gtk
    kitty
    qt
    rofi
    ssh
    tmux
    vim
    shells.fish
    shells.zsh
    shells.starship
    wm.sway
    wm.niri
  ];

  home = {
    username = "comfy";
    stateVersion = "23.05";
    homeDirectory = "/home/comfy";
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    GTK_USE_PORTAL = "1";
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.zoxide.enable = true;
}
