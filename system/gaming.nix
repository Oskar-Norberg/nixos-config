{config, lib, pkgs, ...}:

{
  allowedUnfreePackages = [
    "steam-unwrapped"
    "steam-run"
    "steam"
  ];

  environment.systemPackages = with pkgs; [
    steam-run
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # environment.systemPackages = with pkgs; [
  #   protonup-qt
  # ];

  programs.gamescope.enable = true;
}
