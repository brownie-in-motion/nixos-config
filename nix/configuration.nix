{ config, lib, pkgs, ... }:

{
  # time.timeZone = "Europe/Madrid";
  time.timeZone = "America/Los_Angeles";
  # time.timeZone = "America/New_York";
  # time.timeZone = "America/Chicago";
  # time.timeZone = "Asia/Singapore";
  # time.timeZone = "Asia/Tokyo";
  # time.timeZone = "Europe/Paris";
  # time.timeZone = "Europe/London";

  nix.channel.enable = false;
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
  };

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users = {
    users.${config.primary} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "dialout" "docker" "video" ];
      password = "";
      shell = pkgs.fish;
    };
    users.root.password = "";
    mutableUsers = false;
  };
  security.sudo.wheelNeedsPassword = false;
  programs.fish.enable = true;

  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIEfTCCAuWgAwIBAgIQG4ap4eJBVz9d8PzPEpWJeDANBgkqhkiG9w0BAQsFADBX
      MR4wHAYDVQQKExVta2NlcnQgZGV2ZWxvcG1lbnQgQ0ExFjAUBgNVBAsMDWRhbmll
      bEBkYW5pZWwxHTAbBgNVBAMMFG1rY2VydCBkYW5pZWxAZGFuaWVsMB4XDTI0MDUx
      NjIzNTIwNFoXDTM0MDUxNjIzNTIwNFowVzEeMBwGA1UEChMVbWtjZXJ0IGRldmVs
      b3BtZW50IENBMRYwFAYDVQQLDA1kYW5pZWxAZGFuaWVsMR0wGwYDVQQDDBRta2Nl
      cnQgZGFuaWVsQGRhbmllbDCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGB
      AN+JC2OTafelek5nA3uuAKdo2zghpmdG3hl+nU/K/ObkoyEl/1bwIoNBJfoDyyjP
      fn2uRJkg+RlU+K24Qws9Y2yL5LBt1eI7Mq51htyIxoOxJlZejgq49FGG2kSglH7X
      meVGCTPtNcFPzOU1W/id/b0H0rmzjdkFMkT3hEDLlFrY6P718MIxNVwHkgJMdJDE
      zXasUEM/CQAOIAFaMPoKUN+zv2fIbsZzqrQdm7GDSXq/U4QBDN6+kdZiBfbkcIk8
      qfWcT9mPyFFCtHEW6QcfOB8THIFo0TDJqAUkT6LhcBsuxlLv4mPF5quSzxtWNIlj
      7GIQV3lUbi9Hpq3mCxrbF0QK/EjHDlY7+4zqp5hz/dTFs9DgXCj1DyOS1fUyoXmN
      Xs/ItU9U6TDSz0pdP+omJILUyZgdy71S+roQA7kkefW55QchfJ3h+5Dyh8eDlSpb
      axmQKGhnc+KH0GjEjv4Da94xy0tM8duj/ZyJpu+puRPtB9NLhZHdBp+uCdM0D/df
      twIDAQABo0UwQzAOBgNVHQ8BAf8EBAMCAgQwEgYDVR0TAQH/BAgwBgEB/wIBADAd
      BgNVHQ4EFgQU9xepn6llwe7tKFhivTKW7xYsajgwDQYJKoZIhvcNAQELBQADggGB
      AH0R1+NLcZZ5X7OJmv/0M7/N28ITlVdmin01iqID/OLck3UBjwSuc3zDKeZQ1+pA
      uXPfa3vvbvF+IMqOH7SU0di9obd3qeZ3eBI/zuBLSyvTvGhHoKPqUHpDyi6qv/Q3
      mpcp5QbfPqNj+AOS1MJNL3LIv6mW4wXO+aV90V5cUL5UNF9wst9G+dsPvOJIDZzf
      k+z/OhNsRPA1uY8+n3Anu0jx0bw7VKzEZ0ge4lGjUhjFcrd3g78ZjKI4wi85CNCj
      g3aQgbNFGtsh9qDZpNOHThQhy8R8XemugjCFZhV1J46YErUC64iH7UG4JKPy5Xpa
      s+pudams3OteB4Zsa/HfkOPRbjzReCQNmb6AlT/8SECYdc8PCPJVGC2hLLInNQdj
      gNAMtTsyxbwgUOhpxhoUr8qXC+WQsK2XYdxSD5K4zweKREr/YHFbWFnD1c5HzWAu
      YK1kddLhDcvbz4AVvm1HNIe6YCAcZQKWXPUVKPOqV7iRJ2VOzHimFhXMyqlrZPMM
      GA==
      -----END CERTIFICATE-----
    ''
  ];

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

  fileSystems = {
    "/encrypted" = {
      device = "/dev/mapper/encrypted";
      fsType = "ext4";
    };
  };

  fonts.packages = [ pkgs.noto-fonts-cjk-sans ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
