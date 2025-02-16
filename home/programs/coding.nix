{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    cargo
    cargo-bisect-rustc
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
    nodePackages.pnpm
    (python312Packages.python.withPackages (p: [
      p.genanki
      p.openai
      p.pillow
      p.pwntools
      p.matplotlib
      p.requests
      p.z3
    ]))
    poetry
    ocaml-ng.ocamlPackages_5_1.ocaml
    ocaml-ng.ocamlPackages_5_1.dune_3
    solana-cli
    thonny
  ];
}
