{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottom
    bvi
    cowsay
    comma
    cloudflared
    dig
    exiftool
    ffmpeg
    gdb
    gef
    gifsicle
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
    jadx
    jujutsu
    sage
    scc
    sqlite
    unzip
    wgcf
    wireguard-tools
    xlayoutdisplay
    yt-dlp
    zip
    zsh
  ];

  persist = [
    ".config/jj"
  ];
}
