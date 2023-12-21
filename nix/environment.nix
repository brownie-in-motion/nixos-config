{ config, pkgs, ... }:

let
  inherit (config.users.users.${config.primary}) home;
in
{
  environment = {
    etc = {
      "nixos/flake.nix".source = "${home}/.config/home-manager/flake.nix";
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
