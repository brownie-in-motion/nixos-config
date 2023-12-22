{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    anki
    discord
    gimp
    google-chrome
    lutris
    signal-desktop
    xournalpp
  ];

  persist = [
    ".config/discord"
    ".config/google-chrome"
    ".config/Signal"
  ];
}
