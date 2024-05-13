{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    dpi = if config.hidpi then 220 else 108;

    xkb.options = "caps:ctrl_modifier,altwin:swap_alt_win";
    libinput.touchpad.naturalScrolling = true;
    # faster
    libinput.touchpad.accelSpeed = "0.2";

    wacom = {
      enable = true;
    };

    windowManager.i3.enable = true;
    displayManager = {
      defaultSession = "none+i3";
      sddm.enable = true;
      autoLogin = {
        enable = true;
        user = config.primary;
      };
    };

    videoDrivers = [ "intel" "nvidia" ];
  };

  # figure out how to do this properly
  systemd.user.services.wacom-settings = {
    description = "xsetwacom settings";
    script = ''
      XSETWACOM=${pkgs.xf86_input_wacom}/bin/xsetwacom

      $XSETWACOM --set "Wacom Intuos BT S Pen stylus" Button 1 1
      $XSETWACOM --set "Wacom Intuos BT S Pen stylus" Button 2 pan
      $XSETWACOM --set "Wacom Intuos BT S Pen stylus" Button 3 3
      $XSETWACOM --set "Wacom Intuos BT S Pen stylus" TabletPCButton on
    '';
    wantedBy = [ "default.target" ];
  };
}
