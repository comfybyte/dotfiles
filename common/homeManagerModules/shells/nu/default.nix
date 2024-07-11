{ unstable, ... }: {
  programs.nushell = {
    enable = true;
    package = unstable.nushell;
    configFile.source = ./config.nu;
  };
}
