{config, pkgs, ...}:

{
  allowedUnfreePackages = [
    "steam-unwrapped"
    "steam-run"
    "steam"
  ];

  home.packages = with pkgs; [
    xivlauncher
  ];
}
