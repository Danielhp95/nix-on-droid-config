{
  description = "nix-on-droid configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.05";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    nix-on-droid.url = "github:t184256/nix-on-droid";
    nix-on-droid.inputs.nixpkgs.follows = "nixpkgs";
    nix-on-droid.inputs.home-manager.follows = "home-manager";

    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";

    nix2vim.url = "github:gytis-ivaskevicius/nix2vim";
    nix2vim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-on-droid, nix2vim, utils, nixpkgs, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      sharedOverlays = [
        import ./overlays.nix
        nix2vim.overlay
      ];

      nixOnDroidConfigurations = {
        device = nix-on-droid.lib.nixOnDroidConfiguration {
          config = ./nix-on-droid.nix;
          system = "aarch64-linux";
          extraModules = [
            # import source out-of-tree modules like:
            # flake.nixOnDroidModules.module
          ];
          extraSpecialArgs = {
            # arguments to be available in every nix-on-droid module
          };

        };
      };
    };
}
