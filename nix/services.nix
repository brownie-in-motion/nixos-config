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
    '';

    picom = {
      enable = true;
      backend = "xrender";
      vSync = true;
    };

    mullvad-vpn.enable = true;
  };
}
