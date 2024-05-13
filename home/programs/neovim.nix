{ pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      packer-nvim
      nvim-treesitter.withAllGrammars
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
    ];
    extraPackages = [
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.prettier
      pkgs.nodePackages.pyright
      pkgs.ltex-ls
      pkgs.texlive.combined.scheme-full
      pkgs.haskellPackages.haskell-language-server
      pkgs.rust-analyzer
      pkgs.ocamlPackages.ocaml-lsp
    ];
  };

  persist = [
    ".config/nvim"
    ".config/github-copilot"
  ];
}
