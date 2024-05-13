{ config, pkgs, ... }:

let
  spotify = pkgs.symlinkJoin {
    name = "spotify";
    paths = [ pkgs.spotify ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/spotify \
        --set HOME "${config.xdg.configHome}/spotify/"
    '';
  };
in
{
  home.packages = [ spotify ];
  persist = [ ".config/spotify" ];
}
