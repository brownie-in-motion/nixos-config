{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    anki
    ardour
    arduino
    audacity
    chromium
    discord
    firefox
    freecad
    ghidra
    gimp
    google-chrome
    gthumb
    inkscape
    insomnia
    musescore
    obs-studio
    openshot-qt
    osu-lazer-bin
    (prismlauncher.override {
      jdks = [ temurin-bin-21 ];
    })
    signal-desktop
    stepmania
    syncplay
    telegram-desktop
    tiled
    transmission_4
    vcv-rack
    vlc
    xournalpp
    zotero
  ];

  persist = [
    ".config/discord"
    ".config/google-chrome"
    ".config/Signal"
    ".config/syncplay.ini"
    ".steam"
    ".zotero"
    ".arduino"
  ];
}
