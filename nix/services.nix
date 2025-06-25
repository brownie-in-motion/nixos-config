{ pkgs, ... }:

{
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      wireplumber.enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };

    printing.enable = true;
    tailscale.enable = true;

    udev.extraRules = ''
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666"
      KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1"
      RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
      RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
    '';

    picom = {
      enable = true;
      backend = "xrender";
      vSync = true;
    };

    mullvad-vpn.enable = true;
    razer-laptop-control.enable = true;
  };
}
