{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host codeberg.org
        AddressFamily inet
    '';
  };
}
