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

  programs.prismlauncher = {
    enable = true;
    package = pkgs.prismlauncher.override {
      jdks = with pkgs; [
        temurin-bin-8
        temurin-bin-17
        temurin-bin-21
      ];
    };
  };
}
