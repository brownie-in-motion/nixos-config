{ config, pkgs, ... }:

{
  environment = {
    etc = {
      "nixos/flake.nix".source = "${config.persistentDir}/home/daniel/.config/home-manager/flake.nix";
    };

    systemPackages = with pkgs; [
      git
      neovim

      nvtop
    ];

    variables = {
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    };
  };
}
