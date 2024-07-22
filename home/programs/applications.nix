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
    ghidra
    gimp
    google-chrome
    inkscape
    insomnia
    musescore
    obs-studio
    openshot-qt
    osu-lazer-bin
    prismlauncher
    signal-desktop
    stepmania
    telegram-desktop
    tiled
    vcv-rack
    vlc
    xournalpp
    zotero
  ];

  persist = [
    ".config/discord"
    ".config/google-chrome"
    ".config/Signal"
    ".steam"
    ".zotero"
    ".arduino"
  ];
}
