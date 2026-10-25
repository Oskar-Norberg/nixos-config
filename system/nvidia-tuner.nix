{ lib, pkgs, ... }:

let
  nvidia-tuner = pkgs.callPackage ./packages/nvidia-tuner.nix { };
in
{
  environment.systemPackages = [ nvidia-tuner ];

  systemd.services.nvidia-tuner = {
    description = "NVIDIA GPU clock limit and fan curve";
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = lib.concatStringsSep " " [
        (lib.getExe nvidia-tuner)
        "--max-core-clock 1575"
        "--pairs 30:20,60:40,80:40,81:100"
        "--fan-speed-update-period 5"
        "--temperature-hysteresis 4"
      ];
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
