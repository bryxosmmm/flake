{ config, ... }:
let
  user = config.system.primaryUser;
in
{
  users.users.${user} = {
    home = "/Users/${user}";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = {
      home.username = user;
      home.stateVersion = "23.11";
      imports = [
        ./ghostty
        ./helix
      ];
    };
  };
}
