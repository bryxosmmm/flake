{ lib, ... }:
{
  homebrew.casks = lib.mkAfter [
    "karabiner-elements"
    "obs"
  ];
}
