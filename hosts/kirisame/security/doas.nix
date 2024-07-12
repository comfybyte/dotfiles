let
  mkSudoRule = opts: { groups = [ "wheel" ]; } // opts;
  noPass = cmd:
    mkSudoRule {
      inherit cmd;
      noPass = true;
    };
in {
  security.doas.enable = true;
  security.doas.extraRules =
    [ (mkSudoRule { persist = true; }) (noPass "nixos-rebuild") ];
}
