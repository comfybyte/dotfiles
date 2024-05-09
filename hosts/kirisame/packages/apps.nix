{ pkgs, inputs, stable, system, ... }:
let wayland = inputs.wayland.packages.${system};
in {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.okular # PDF viewer.
    libsForQt5.kdenlive # video editor.
    vlc # video player.
    xfce.tumbler
    discord
    tenacity # Audio editor.
    krita # Image editor.
    vivaldi
    vivaldi-ffmpeg-codecs
    libreoffice-fresh
    obsidian
    emote # Emoji picker.
    firefox-devedition
    stable.floorp
    librewolf
    tor-browser
    hyprpicker # Colour picker.
    localsend
    fractal # Matrix client.
    wayland.wf-recorder
  ];
}
