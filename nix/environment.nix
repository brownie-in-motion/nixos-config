{ config, lib, pkgs, ... }:

let
  inherit (config.users.users.${config.primary}) home;
in
{
  environment = {
    etc = {
      "X11/xorg.conf.d/80-wacom.conf".text = lib.mkForce ''
        Section "InputClass"
          Identifier "Wacom Intuos BT S Pad"
          MatchDriver "wacom"
          MatchProduct "Pad"
          Option "Button1" "1"
          Option "Button2" "13"
          Option "Button3" "11"
          Option "Button4" "12"
        EndSection
      '';
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
      crypttab.text = ''
        encrypted UUID=1ba9ba7c-1046-4240-8a68-b4ccd815c0af /keep/encrypted.key
      '';
    };

    systemPackages = with pkgs; [
      git
      neovim
      nvtop
    ];

    variables = if config.hidpi then {
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    } else {};
  };
}
