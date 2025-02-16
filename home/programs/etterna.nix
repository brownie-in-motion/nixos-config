# want to wrap /home/daniel/media/games/etterna/Etterna/Etterna

{ config, pkgs, ... }:

let
  etterna = pkgs.buildFHSEnv {
    name = "etterna";

    multiPkgs = pkgs: with pkgs; [
      openssl_1_1
      xorg.libX11
      xorg.libXext
      xorg.libXrandr
      pulseaudio
      libGL
      libGLU
      gcc
      libstdcxx5
      zlib
    ];

    runScript = "/home/daniel/media/games/etterna/Etterna/Etterna";
  };
in
{
  home.packages = [ etterna ];
}
