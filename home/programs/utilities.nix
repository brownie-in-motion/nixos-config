{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottom
    lshw
    mesa-demos
    pulsemixer
    xclip
  ];
}
