{ pkgs, ... }:

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
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.pyright
    ];
  };

  persist = [
    ".config/nvim"
    ".config/github-copilot"
  ];
}
