{ config, lib, pkgs, ... }:

{
  programs.nix-ld.enable = true;
  # Yoinked from https://github.com/NixOS/nixpkgs/issues/354513
  programs.nix-ld.libraries = [
    (pkgs.runCommand "steamrun-lib" { } ''
      mkdir $out
      ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib
    '')
  ];
}