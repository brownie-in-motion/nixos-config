{ config, ... }:

{
  programs.fuse.userAllowOther = true;
  environment.persistence.${config.persistentDir} = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/lib/libvirt"
      "/var/lib/tailscale"
      "/etc/mullvad-vpn"
      "/etc/NetworkManager/system-connections"
    ];
    files = [ "/etc/machine-id" ];
    users.${config.primary} = {
      directories = [
        "media"
        "scripts"
        "stuff"

        ".cache"
        ".cargo"
        ".local"

        ".config/fish"
        ".config/home-manager"
        ".docker"
        ".stack"
        { directory = ".ssh"; mode = "0700"; }
      ];
    };
  };
}
