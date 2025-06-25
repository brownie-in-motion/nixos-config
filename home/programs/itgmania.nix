{ config, pkgs, ... }:

let
  itgmania = pkgs.symlinkJoin {
    name = "itgmania";
    paths = [ pkgs.itgmania ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/itgmania \
        --set HOME "${config.xdg.configHome}/itgmania/"
    '';
  };
in
{
  home.packages = [ itgmania ];
  persist = [ ".config/itgmania" ];
}

