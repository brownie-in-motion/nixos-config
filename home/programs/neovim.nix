{ pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
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
      pkgs.ccls
      pkgs.gopls
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.prettier
      pkgs.pyright
      pkgs.ltex-ls
      pkgs.texlive.combined.scheme-full
      pkgs.haskellPackages.haskell-language-server
      pkgs.rust-analyzer
      pkgs.ocamlPackages.ocaml-lsp
      pkgs.vscode-langservers-extracted
      pkgs.yaml-language-server
    ];
  };

  persist = [
    ".config/nvim"
    ".config/github-copilot"
  ];
}
