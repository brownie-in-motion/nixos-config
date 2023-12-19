{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ocaml
    ocamlPackages.dune_3
  ];
}
