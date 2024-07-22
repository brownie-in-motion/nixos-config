{
  imports = [
    ./cuda-maintainers.nix
    ./1lab.nix
  ];

  nix.settings.substituters = ["https://cache.nixos.org"];
}
