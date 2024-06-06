let
  mkSudoRule = opts: {
    groups = ["wheel"];
  } // opts;
  noPass = cmd: mkSudoRule {
    inherit cmd;
    noPass = true;
  };
  persist = cmd: mkSudoRule {
    inherit cmd;
    persist = true;
  };
in {
  security.doas.enable = true;
  security.doas.extraRules = [ (noPass "nixos-rebuild") (persist "nix") ];
}
