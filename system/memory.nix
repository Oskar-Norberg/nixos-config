{config, lib, pkgs, ...}:

{
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024; # MiB
    }
  ];

  boot.zswap = {
    enable = true;
    compressor = "zstd";
    maxPoolPercent = 25;
    shrinkerEnabled = true;
  };

  systemd.oomd.enableUserSlices = true;
}
