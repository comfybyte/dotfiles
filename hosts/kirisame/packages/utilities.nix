{ pkgs, stable, inputs, system, ... }:
let
  nixprs = inputs.nixprs.packages.${system};
  quick-stack = inputs.quick-stack.packages.${system};
in {
  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.dconf.enable = true;
  programs.gnupg.agent.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    mako
    swww
    wl-clipboard
    xdg-utils
    glib
    grim
    slurp
    libnotify
    imagemagick
    num-utils
    luajit
    speechd
    patchelf
    xorg.xhost
    inetutils
    nmap
    ripgrep
    jq
    fzf
    fd
    gnupg
    pinentry
    pulsemixer
    eza
    httpie
    wget
    htop
    btop
    dig
    uutils-coreutils
    du-dust
    bat
    handlr-regex
    stable.zenith
    transmission
    transmission-gtk
    piper
    pulseaudio
    pavucontrol
    toybox
    gtk4
    keepassxc
    bitwarden-cli
    yazi
    jot

    nix-prefetch-git
    zip
    unzip
    unrar
    git
    imv
    mpv
    keychain
    cachix
    wmctrl
    betterdiscordctl
    p7zip
    virt-manager
    nixos-shell
    nix-tree
    ffmpeg

    nodejs_18
    cargo
    cargo-info
    nixfmt

    quick-stack.default
    nixprs.sshot
  ];
}
