{ config, lib, ... }:

{
  services.printing = {
    enable = true;
    extraConf = lib.mkForce "";
  };
}
