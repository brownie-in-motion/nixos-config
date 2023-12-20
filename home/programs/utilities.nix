{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottom
    lshw
    neofetch
    mesa-demos
    pulsemixer
    ripgrep
    xclip
  ];
}
