{ config, pkgs, ... }:

let
  ingrid = pkgs.buildFHSEnv {
    name = "ingrid";

    multiPkgs = pkgs: with pkgs; [
      expat
      glib
      gtk3
      pango
      cairo
      libxkbcommon
      xorg.libX11
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXrandr
      xorg.libxcb
      at-spi2-core
      at-spi2-atk
      atk
      atkmm
      atk
      cups
      nss
      nspr
      dbus
      libdrm
      libepoxy
      libGL
      libgbm
      mesa
      alsa-lib
      pkg-config
      systemd
    ];

    runScript = "/home/daniel/stuff/puzzle/ingrid/Ingrid";
  };
in
{
  home.packages = [ ingrid ];
  persist = [ ".config/Ingrid" ];
}

