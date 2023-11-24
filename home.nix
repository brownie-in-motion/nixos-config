{ config, pkgs, ... }:

{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish.enable = true;

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 48;
    x11.enable = true;
    gtk.enable = true;
  };

  xresources.properties = {
    "Xft.antialias" = true;
    "Xft.hinting" = true;
    "Xft.rgba" = "rgb";
    "Xft.hintstyle" = "hintful";
    "Xft.dpi" = 220;
  };

  home.packages = with pkgs; [
    fishPlugins.fzf
    fishPlugins.z

    xclip
    kitty
    tmux
    pulsemixer

    google-chrome

    discord

    gimp

    feh
  ];
}
