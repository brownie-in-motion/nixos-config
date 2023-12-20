{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    deno
    nodejs_21

    ghc
    ghcid

    python311Packages.python
    python311Packages.pillow
    python311Packages.requests
    python311Packages.z3

    ocaml
    ocamlPackages.dune_3
  ];
}
