{ pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      focus = {
        followMouse = false;
      };
      startup = [
        {
          always = true;
          command = ''
            feh --no-fehbg --bg-scale ~/media/images/background-among-us.png
          '';
          notification = false;
        }
      ];
      terminal = "kitty";
    };
  };

  home.packages = [
    pkgs.feh
  ];
}
