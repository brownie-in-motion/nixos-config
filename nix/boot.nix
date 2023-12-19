{
  boot = {
    loader = {
      efi.canTouchEfiVariables = false;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    };
    kernelParams = [ "button.lid_init_state=open" ];
  };

}
