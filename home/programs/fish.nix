{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = "fish_add_path ~/scripts";
  };
  home.packages = with pkgs; [
    fishPlugins.fzf
    fishPlugins.z
  ];
}
