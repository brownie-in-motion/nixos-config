{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottom
    bvi
    cargo-bisect-rustc
    cloudflared
    dig
    dnsmasq
    exiftool
    ffmpeg
    gdb
    gef
    gifsicle
    gthumb
    lshw
    mesa-demos
    mkcert
    ncdu
    neofetch
    nftables
    nmap
    openssl
    openvpn
    poppler_utils
    pulsemixer
    powertop
    ripgrep
    sage
    scc
    sqlite
    unzip
    xclip
    xlayoutdisplay
    yt-dlp
    zip
    zsh
  ];

  persist = [ ".docker/config.json" ];
}
