{
  outputs = inputs@{ nixpkgs, treefmt, stable, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      eachSupportedSystem = nixpkgs.lib.genAttrs supportedSystems;
    in {
      nixosConfigurations = import ./hosts inputs;

      homeManagerModules = import ./common/homeManagerModules;

      nixosModules = import ./common/nixosModules;

      formatter = eachSupportedSystem (system:
        (treefmt.lib.evalModule nixpkgs.legacyPackages.${system}
          ./treefmt.nix).config.build.wrapper);
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stable.url = "github:nixos/nixpkgs/nixos-21.11";

    treefmt.url = "github:numtide/treefmt-nix";

    steam-tui.url = "github:dmadisetti/steam-tui";

    home = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    extra = {
      url = "github:comfybyte/nixpkgs-extra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    connect-timeout = 20;
    substituters = [
      "https://cache.nixos.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://nix-community.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
    ];
  };
}
