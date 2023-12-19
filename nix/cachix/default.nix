{
  imports = [
    ./cuda-maintainers.nix
  ];

  nix.settings.substituters = ["https://cache.nixos.org"];
}
