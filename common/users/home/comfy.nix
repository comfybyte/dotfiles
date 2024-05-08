{ inputs, lib, config, ... }:
let
  id = {
    name = "Mai";
    email = "comfybyte@proton.me";
    gpgKey.id = "9C8577B87600DD7A";
  };
  usingNeovim = config.programs.nixvim.enable;
in {
  imports = with inputs.self.homeManagerModules;
    [
      alacritty
      cursor
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
    sessionVariables = {
      EDITOR = lib.mkIf usingNeovim "nvim";
      GTK_USE_PORTAL = "1";
    };
  };
  programs.git = {
    enable = true;
    userName = id.name;
    userEmail = id.email;
    signing = {
      signByDefault = true;
      key = id.gpgKey.id;
    };
    extraConfig = {
      core.editor = lib.mkIf usingNeovim "nvim";
      init.defaultBranch = "main";
      push.default = "current";
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
