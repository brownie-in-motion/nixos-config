{ config, ... }:

{
  environment.persistence.${config.persistentDir} = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/etc/NetworkManager/system-connections"
    ];
    files = [ "/etc/machine-id" ];
    users.daniel = {
      directories = [
        "media"
        "scripts"
        "stuff"
        ".config/nvim"
        ".config/fish"
        ".config/home-manager"
        ".local/share/Steam"
        { directory = ".ssh"; mode = "0700"; }
      ];
    };
  };
}
