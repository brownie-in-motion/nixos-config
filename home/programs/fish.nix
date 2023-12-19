{ pkgs, ... }:

{
  programs.fish.enable = true;
  home.packages = with pkgs; [
    fishPlugins.fzf
    fishPlugins.z
  ];
}
