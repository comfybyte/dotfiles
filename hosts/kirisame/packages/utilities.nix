{ pkgs, stable, inputs, system, ... }:
let extra = inputs.extra.packages.${system};
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
    gitui
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

    nix-prefetch-git
    nodePackages.serve
    zip
    unzip
    unrar
    wdisplays
    git
    imv
    mpv
    parted
    keychain
    cachix
    cloc
    shellcheck
    wmctrl
    betterdiscordctl
    p7zip
    virt-manager
    nixos-shell
    nix-tree
    mlt
    ffmpeg
    dooit

    nodejs_18
    cargo
    cargo-info
    nixfmt
    ghc
    clojure
    clj-kondo

    extra.sshot
    extra.retag
  ];
}
