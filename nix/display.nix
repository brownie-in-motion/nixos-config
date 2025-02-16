{ config, ... }:

{
  services.displayManager = {
    defaultSession = "none+i3";
    sddm.enable = true;
    autoLogin = {
      enable = true;
      user = config.primary;
    };
  };
}
