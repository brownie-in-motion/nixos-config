{ config, pkgs, ... }:

let
  vscode = pkgs.symlinkJoin {
    name = "vscode";
    paths = [ pkgs.vscode ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/code \
        --append-flags "--extensions-dir /home/daniel/stuff/audit/vscode-data"
    '';
  };
in
{
  home.packages = [ vscode ];
}
