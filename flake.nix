{
  outputs = inputs: {
    nixosConfigurations = import ./hosts inputs;
    homeManagerModules = import ./common/homeManagerModules;
    nixosModules = import ./common/nixosModules;
  };

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixprs.url = "github:mtlhrt/nixprs";
    quick-stack.url = "github:mtlhrt/quick-stack";
    nyanvim.url = "github:mtlhrt/nyanvim";
    swayfx.url = "github:willpower3309/swayfx";
    wayland.url = "github:nix-community/nixpkgs-wayland";

    home = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "stable";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "unstable";
    };
  };

  nixConfig = rec {
    connect-timeout = 14;
    substituters = [
      "https://cache.nixos.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-substituters = substituters;
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
