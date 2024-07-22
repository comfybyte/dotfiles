{ inputs, config, system, pkgs, ... }:
let
  id = {
    name = "Mai";
    email = "comfybyte@proton.me";
    gpgKey.id = "9C8577B87600DD7A";
  };
in {
  imports = with inputs.self.homeManagerModules; [
    alacritty
    cursor
    gpg
    gtk
    kitty
    qt
    rofi
    ssh
    tmux
    # vim
    eww
    shells.fish
    shells.zsh
    shells.starship
    shells.nu
    wm.sway
    wm.niri
    wm.i3
  ];

  home = {
    username = "comfy";
    stateVersion = "23.05";
    homeDirectory = "/home/comfy";
    sessionVariables = {
      GTK_USE_PORTAL = "1";
      EDITOR = "nvim";
    };

    packages = let nyanvim = inputs.nyanvim.legacyPackages.${system};
    in with pkgs; [
      (nyanvim.withConfig {
        opts = {
          undodir = "${config.home.homeDirectory}/.cache/nvim/undodir";
          undofile = true;
        };
      })
      weechat
      neomutt
    ];
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
      init.defaultBranch = "main";
      push.default = "current";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
