{ config, pkgs, lib, ... }:
let
    binja = pkgs.buildFHSEnv {
        name = "binaryninja";
        targetPkgs = pkgs: with pkgs; [
            dbus
            fontconfig
            freetype
            libGL
            libxkbcommon
            (python3.withPackages (ps: with ps; [
                torch
            ]))
            xorg.libX11
            xorg.libxcb
            xorg.xcbutilimage
            xorg.xcbutilkeysyms
            xorg.xcbutilrenderutil
            xorg.xcbutilwm
            wayland
            zlib
        ];
        runScript = pkgs.writeScript "binaryninja.sh" ''
            set -e
            exec "$HOME/stuff/binja/binaryninja/binaryninja" "$@"
        '';
        meta = {
            description = "BinaryNinja";
            platforms = ["x86_64-linux"];
        };
    };
in
{
    home.packages = [ binja ];
}
