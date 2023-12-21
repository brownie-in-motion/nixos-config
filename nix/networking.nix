{ config, ... }:

{
  networking = {
    hostName = config.primary;
    networkmanager.enable = true;
  };
}
