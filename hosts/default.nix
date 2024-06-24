inputs@{ stable, unstable, ... }:
let
  unstableFor = system:
    import unstable {
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
in {
  kirisame = stable.lib.nixosSystem (let
    system = "x86_64-linux";
    unstable = unstableFor system;
    specialArgs = { inherit inputs system unstable; };
  in {
    inherit specialArgs;
    modules = [
      ./kirisame
      inputs.nix-index-database.nixosModules.nix-index
      (homeModulesWith specialArgs)
    ];
  });
}
