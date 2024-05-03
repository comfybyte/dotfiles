inputs@{ nixpkgs, ... }: {
  kirisame = nixpkgs.lib.nixosSystem (let
    system = "x86_64-linux";
    stable = import inputs.stable {
      inherit system;
      config.allowUnfree = true;
    };
    homeModulesWith = specialArgs: {
      imports = [ inputs.home.nixosModules.home-manager ];
      home-manager = {
        extraSpecialArgs = specialArgs;
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };
    specialArgs = { inherit inputs system stable; };
  in {
    inherit specialArgs;
    modules = [
      ./kirisame
      inputs.nix-index-database.nixosModules.nix-index
      (homeModulesWith specialArgs)
    ];
  });
}
