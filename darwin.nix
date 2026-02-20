{ username, ... }:
{
  imports = [
    ./modules/darwin/system.nix
    ./modules/darwin/homebrew.nix
    ./modules/home
  ];

  # Required for options that now apply to the primary user (e.g. homebrew).
  # Set per-host in flake.nix.
  system.primaryUser = username;
}
