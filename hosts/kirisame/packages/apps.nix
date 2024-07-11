{ pkgs, inputs, system, ... }:
let wayland = inputs.wayland.packages.${system};
in {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.okular
    libsForQt5.kdenlive
    vlc
    xfce.tumbler
    vesktop
    tenacity
    krita
    (vivaldi.override { proprietaryCodecs = true; })
    libreoffice-fresh
    obsidian
    emote
    firefox-devedition
    floorp
    tor-browser
    librewolf
    lynx
    hyprpicker
    localsend
    fractal
    wayland.wf-recorder
  ];
}
