{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    gimp
    google-chrome
    lutris
    signal-desktop
    spotify
  ];
}
