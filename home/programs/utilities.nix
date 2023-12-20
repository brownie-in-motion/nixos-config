{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux

    pulsemixer

    xclip

    mesa-demos
    bottom
    lshw
  ];
}
