{
  description = "nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ nixpkgs, home-manager, impermanence, ... }:
    let
      primary = "daniel";
      importDir = path: {
        imports = map (name: ./${path}/${name})
          (builtins.attrNames (builtins.readDir ./${path}));
      };
      configModule = ({ lib, ... }: {
        options.persistentDir = lib.mkOption {
          type = lib.types.path;
          default = "/keep";
        };
        options.primary = lib.mkOption {
          type = lib.types.str;
          default = primary;
        };
        options.persist = lib.mkOption {
          type = with lib.types; listOf str;
          default = [];
        };
        options.hidpi = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      });
    in {
    nixosConfigurations = {
      ${primary} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (importDir "nix")
          configModule
          home-manager.nixosModules.home-manager
          impermanence.nixosModules.impermanence
          {
            nixpkgs.overlays = [
              inputs.neovim-nightly-overlay.overlay
            ];
          }
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${primary} = importDir "home";
              sharedModules = [
                "${impermanence}/home-manager.nix"
                configModule
              ];
            };
          }
        ];
      };
    };
  };
}
