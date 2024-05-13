{ config, pkgs, ... }:

{
  # we do this here rather than in home manager because we want to pull in the
  # config.hidpi parameter from the specialisation configuration

  # services.xserver.displayManager.sessionCommands = ''
  #   ${pkgs.xorg.xrdb}/bin/xrdb -merge <<EOF
  #     Xft.antialias = true;
  #     Xft.hinting = true;
  #     Xft.rgba = rgb;
  #     Xft.hintstyle = hintful;
  #     Xft.dpi = ${if config.hidpi then "220" else "108"};
  #   EOF
  # '';

  services.xserver.displayManager.sessionCommands = ''
  ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
      Xft.antialias: true
      Xft.hinting: true
      Xft.rgba: rgb
      Xft.hintstyle: hintful
      Xft.dpi: ${if config.hidpi then "220" else "108"}
    ''}
  '';
}
