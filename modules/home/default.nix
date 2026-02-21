{ config, lib, ... }:
let
  user = config.system.primaryUser;
in
{
  users.users.${user} = {
    home = lib.mkDefault "/Users/${user}";
  };

  home-manager = {
    useGlobalPkgs = lib.mkDefault true;
    useUserPackages = lib.mkDefault true;
    users.${user} = {
      home.username = lib.mkDefault user;
      home.stateVersion = lib.mkDefault "23.11";
      imports = [
        ./direnv.nix
        ./ghostty.nix
        ./helix
      ];
    };
  };
}
