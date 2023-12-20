{ config, lib, pkgs, ... }:

{
  time.timeZone = "America/Los_Angeles";

  nix.channel.enable = false;
  nixpkgs.config.allowUnfree = true;

  users = {
    users.daniel = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      password = "";
      shell = pkgs.fish;
    };
    mutableUsers = false;
  };
  security.sudo.wheelNeedsPassword = false;
  programs.fish.enable = true;

  # impermanence
  # i dont want to touch hardware-config.nix so let's overwrite
  fileSystems = lib.mkForce {
    "/" = {
      fsType = "tmpfs";
      options = [ "size=2G" "mode=755" ];
    };
    ${config.persistentDir} = {
      device = "/dev/disk/by-uuid/3c40ae84-cc0b-4ebc-8aad-d5200c85dc76";
      fsType = "ext4";
      neededForBoot = true;
    };
    "/nix" = {
      device = "${config.persistentDir}/nix";
      options = [ "bind" ];
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
