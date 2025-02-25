{ config, lib, ... }:
{
  specialisation = {
    # day to day config
    laptop.configuration = {
      system.nixos.tags = [ "laptop" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce true;
        prime.offload.enableOffloadCmd = lib.mkForce true;
        prime.sync.enable = lib.mkForce false;
      };
      services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
      services.picom.backend = lib.mkForce "glx";
      hardware.nvidia.forceFullCompositionPipeline = true;
      services.tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

          CPU_MIN_PERF_ON_AC = 0;
          CPU_MAX_PERF_ON_AC = 100;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 30;
        };
      };
    };

    # single external monitor
    external.configuration = {
      system.nixos.tags = [ "external" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce true;
        prime.offload.enableOffloadCmd = lib.mkForce true;
        prime.sync.enable = lib.mkForce false;
      };
      services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
      services.picom.backend = lib.mkForce "glx";
      hardware.nvidia.forceFullCompositionPipeline = true;
      hidpi = false;
    };

    # sometimes the laptop draws too much power
    airplane.configuration = {
      system.nixos.tags = [ "airplane" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce true;
        prime.offload.enableOffloadCmd = lib.mkForce true;
        prime.sync.enable = lib.mkForce false;
      };
      services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
      services.picom.backend = lib.mkForce "glx";
      hardware.nvidia.forceFullCompositionPipeline = true;

      # always as if on battery (even when charging)
      # so it doesn't draw too much current
      services.tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

          CPU_MIN_PERF_ON_AC = 0;
          CPU_MAX_PERF_ON_AC = 30;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 30;
        };
      };
    };
  };
}
