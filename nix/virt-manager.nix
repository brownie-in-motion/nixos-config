{ config, lib, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
    onBoot = "start";
  };
  programs.virt-manager.enable = true;
  environment.systemPackages = [ pkgs.virtiofsd ];
  users.users.${config.primary}.extraGroups = [ "libvirtd" ];
}
