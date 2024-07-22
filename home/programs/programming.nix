{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    cargo
    cmake
    deno
    erlang
    gcc
    ghc
    ghcid
    gleam
    gnumake
    go
    jetbrains.goland
    lean4
    nodejs_20
    (python311Packages.python.withPackages (p: [
      p.openai
      p.pillow
      p.pwntools
      p.matplotlib
      p.requests
      p.z3
    ]))
    ocaml-ng.ocamlPackages_5_1.ocaml
    ocaml-ng.ocamlPackages_5_1.dune_3
    solana-cli
  ];
}
