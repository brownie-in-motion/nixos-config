{
  services.xserver = {
    enable = true;
    dpi = 200;

    xkb.options = "caps:ctrl_modifier,altwin:swap_alt_win";
    libinput.touchpad.naturalScrolling = true;

    windowManager.i3.enable = true;
    displayManager = {
      defaultSession = "none+i3";
      sddm.enable = true;
      autoLogin = {
        enable = true;
        user = "daniel";
      };
    };

    videoDrivers = [ "intel" "nvidia" ];
  };
}
