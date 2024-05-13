{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    anki
    ardour
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
    openshot-qt
    prismlauncher
    signal-desktop
    stepmania
    telegram-desktop
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
  ];
}
