{ ... }:
{
  # Homebrew integration via nix-darwin. Homebrew must be installed separately,
  # or you can add nix-homebrew later to manage installation.
  homebrew = {
    enable = true;

    # Add formulae, casks, and MAS apps here.
    taps = [ ];
    brews = [ "opencode" ];
    casks = [
        "zen"
        "ghostty"
        "iina"
        "emacs-app"
        "codex"
        "amneziavpn"
       ];
    masApps = { };

    # Example:
    # brews = [ "git" "wget" ];
    # casks = [ "raycast" ];
    # masApps = { "Xcode" = 497799835; };
  };
}
