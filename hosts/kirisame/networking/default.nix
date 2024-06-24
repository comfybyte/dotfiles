{
  imports = [ ./firewall.nix ./ssh.nix ./vpn.nix ];
  networking.hostName = "kirisame";
  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;
}
