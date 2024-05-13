{ config, lib, pkgs, ... }:

{
  time.timeZone = "America/Los_Angeles";
  # time.timeZone = "America/New_York";

  nix.channel.enable = false;
  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users = {
    users.${config.primary} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
      password = "";
      shell = pkgs.fish;
    };
    users.root.password = "";
    mutableUsers = false;
  };
  security.sudo.wheelNeedsPassword = false;
  programs.fish.enable = true;

  # impermanence
  fileSystems = {
    "/" = lib.mkForce {
      fsType = "tmpfs";
      options = [ "size=4G" "mode=755" ];
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

  # convenience
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/4C3A-F314";
    };
    "/old" = {
      device = "/dev/disk/by-uuid/b556b5e7-10a1-4b81-b05c-1a28714b67bc";
      fsType = "ext4";
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
