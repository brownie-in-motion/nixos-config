{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    gimp
    google-chrome
    lutris
    signal-desktop
    spotify
  ];

  persist = [
    ".config/discord"
    ".config/google-chrome"
    ".config/spotify"
    ".config/Signal"
  ];
}
