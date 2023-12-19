{
  description = "nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      importDir = path: {
        imports = map (name: ./${path}/${name})
          (builtins.attrNames (builtins.readDir ./${path}));
      };
    in {
    nixosConfigurations = {
      daniel = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (importDir "nix")
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.daniel = importDir "home";
          }
        ];
      };
    };
  };
}
