{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  programs.nix-index.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home = {
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.05";

    pointerCursor = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
      size = 48;
      x11.enable = true;
      gtk.enable = true;
    };

    packages = [ pkgs.cachix ];
  };

  xdg.userDirs.download = "temp";

  persist = [ ".config/mimeapps.list" ];
}
