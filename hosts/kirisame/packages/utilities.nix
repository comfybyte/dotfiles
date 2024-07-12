{ pkgs, inputs, system, ... }:
let quick-stack = inputs.quick-stack.packages.${system};
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
    du-dust
    bat
    zenith
    transmission
    transmission-gtk
    piper
    pulseaudio
    pavucontrol
    toybox
    keepassxc
    bitwarden-cli
    yazi

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
    p7zip
    nix-tree
    ffmpeg

    # virtualisation stuff
    qemu
    virt-manager
    nixos-shell

    # should be devshells
    nodejs_18
    cargo
    cargo-info

    quick-stack.default
  ];
}
