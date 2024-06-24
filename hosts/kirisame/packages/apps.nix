{ pkgs, inputs, system, ... }:
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
    (vivaldi.override { proprietaryCodecs = true; })
    libreoffice-fresh
    obsidian
    emote # Emoji picker.
    firefox-devedition
    floorp
    tor-browser
    librewolf
    lynx
    hyprpicker # Colour picker.
    localsend
    fractal # Matrix client.
    wayland.wf-recorder
  ];
}
