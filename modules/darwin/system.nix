{ pkgs, self, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vim
    git
    gh
    nil
    nushell
    helix
    zoxide
    jujutsu
    carapace
    direnv
    ayugram-desktop
  ];

  nix.linux-builder = {
    enable = true;
    systems = [ "aarch64-linux" ];
  };
  nix.settings.trusted-users = [ "@admin" ];


  # Necessary for using flakes on this system.
  nix.settings = {
    experimental-features = "nix-command flakes";
    log-lines = 0;
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    extra-substituters = [
      "https://cache.nixos.org"
    ];
  };

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
