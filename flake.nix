{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager }:
  let
    hosts = {
      "Kirills-Mac-mini" = {
        username = "kirillgerasimov";
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Kirills-Mac-mini
    darwinConfigurations =
      builtins.mapAttrs
        (hostname: host:
          nix-darwin.lib.darwinSystem {
            modules = [
              ./darwin.nix
              home-manager.darwinModules.home-manager
            ];
            specialArgs = {
              inherit self nixpkgs;
              username = host.username;
            };
          }
        )
        hosts;
  };
}
