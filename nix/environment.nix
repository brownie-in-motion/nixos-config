{ config, pkgs, ... }:

let
  inherit (config.users.users.${config.primary}) home;
in
{
  environment = {
    etc = {
      "nixos/flake.nix".source = "${home}/.config/home-manager/flake.nix";

      "xdg/gtk-2.0/gtkrc".text = "gtk-application-prefer-dark-theme=1";
      "xdg/gtk-3.0/settings.ini".text = ''
        [Settings]
        gtk-application-prefer-dark-theme=1
      '';
      "xdg/gtk-4.0/settings.ini".text = ''
        [Settings]
        gtk-application-prefer-dark-theme=1
      '';
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
