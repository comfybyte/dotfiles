let
  noPass = cmd: {
    inherit cmd;
    groups = [ "wheel" ];
    noPass = true;
  };
  persist = cmd: {
    inherit cmd;
    groups = [ "wheel" ];
    persist = true;
  };
in {
  security.doas.enable = true;
  security.doas.extraRules = [ (noPass "nixos-rebuild") (persist "nix") ];
}
