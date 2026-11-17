{ config, pkgs, pkgs-unstable, ... }:

{
  # TODO: One day this flatpack will likely clash with something else
  home.packages = with pkgs; [
    (pkgs-unstable.bottles.override { removeWarningPopup = true; })
  ];
}