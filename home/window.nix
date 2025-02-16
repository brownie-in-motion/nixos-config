{ lib, pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      defaultWorkspace = "workspace number 1";
      focus = {
        followMouse = false;
      };
      keybindings = lib.mkOptionDefault {
        "Print" = "exec maim -su | xclip -selection clipboard -t image/png";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
      };
      modifier = "Mod4";
      startup = [
        {
          always = true;
          command = ''
            feh --no-fehbg --bg-scale ~/media/images/windows.jpg
          '';
          notification = false;
        }
      ];
      terminal = "kitty";
    };
  };

  home.packages = [
    pkgs.feh
    pkgs.maim
    pkgs.xclip
  ];
}
