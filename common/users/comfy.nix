{ pkgs, config, lib, ... }: {
  users.users.comfy = {
    isNormalUser = true;
    home = "/home/comfy";
    extraGroups = [ "wheel" ]
      ++ lib.optional config.programs.wireshark.enable "wireshark"
      ++ lib.optional config.virtualisation.libvirtd.enable "libvirt"
      ++ lib.optional config.virtualisation.docker.enable "docker";
    shell = pkgs.fish;
  };
  home-manager.users.comfy = import ./home/comfy.nix;
}
