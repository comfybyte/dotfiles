{ pkgs, inputs, system, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  environment.systemPackages =
    let steam-tui = inputs.steam-tui.packages.${system};
    in [ pkgs.steamPackages.steamcmd steam-tui.default ];
}
