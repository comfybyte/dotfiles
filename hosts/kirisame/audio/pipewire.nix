{ pkgs, ... }: {
  sound.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  # hardware.pulseaudio = {
  #   enable = true;
  #   support32Bit = true;
  # };

  environment.systemPackages = [ pkgs.qpwgraph pkgs.easyeffects ];
}
