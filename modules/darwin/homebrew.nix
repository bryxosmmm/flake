{ ... }:
{
  # Homebrew integration via nix-darwin. Homebrew must be installed separately,
  # or you can add nix-homebrew later to manage installation.
  homebrew = {
    enable = true;

    # Add formulae, casks, and MAS apps here.
    taps = [ ];
    brews = [
      "opencode"
      "colima"
      "docker"
      "docker-buildx"
      "docker-compose"
    ];
    casks = [
      "zen"
      "ghostty"
      "iina"
      "emacs-app"
      "codex"
      "amneziavpn"
      "vesktop"
    ];
    masApps = { };

    # Example:
    # brews = [ "git" "wget" ];
    # casks = [ "raycast" ];
    # masApps = { "Xcode" = 497799835; };
  };
}
