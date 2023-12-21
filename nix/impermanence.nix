{ config, ... }:

{
  programs.fuse.userAllowOther = true;
  environment.persistence.${config.persistentDir} = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/systemd"
      "/etc/NetworkManager/system-connections"
    ];
    files = [ "/etc/machine-id" ];
    users.${config.primary} = {
      directories = [
        "media"
        "scripts"
        "stuff"

        ".cache"
        ".local"

        ".config/fish"
        ".config/home-manager"
        { directory = ".ssh"; mode = "0700"; }
      ];
    };
  };
}
