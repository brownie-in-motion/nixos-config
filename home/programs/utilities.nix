{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottom
    bvi
    cloudflared
    dig
    ffmpeg
    gdb
    gef
    gifsicle
    gthumb
    lshw
    mesa-demos
    ncdu
    neofetch
    openvpn
    poppler_utils
    pulsemixer
    powertop
    ripgrep
    sage
    scc
    unzip
    xclip
    xlayoutdisplay
    yt-dlp
    zip
    zsh
  ];

  persist = [ ".docker/config.json" ];
}
