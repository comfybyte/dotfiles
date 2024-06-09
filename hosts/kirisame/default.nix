{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./audio
    ./packages
    ./security
    ./networking
    ./boot
    ./input.nix
    ../../common/users
    inputs.self.nixosModules.steam
  ];

  nix = {
    package = pkgs.nixFlakes;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  nixpkgs.config.allowUnfree = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    driSupport = true;
    extraPackages = with pkgs; [ intel-vaapi-driver vaapiVdpau libvdpau-va-gl ];
  };

  environment.shells = with pkgs; [ zsh fish ];
  services = {
    dbus.enable = true;
    displayManager.defaultSession = "none+i3";
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      xkb.layout = "br";
      exportConfiguration = true;
      displayManager.lightdm.enable = false;
      videoDrivers = [ "video-intel" "mesa" "vulkan-intel" ];
    };
    ratbagd.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";

    PATH = [ "${XDG_BIN_HOME}" ];
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    config.common.default = [ "gtk" ];
  };

  programs.command-not-found.enable = false;

  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "America/Sao_Paulo";
  system.stateVersion = "23.11";
}
