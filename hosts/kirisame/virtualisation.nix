{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ libvirt nixos-shell ];
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  programs.virt-manager.enable = true;
}
