{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    extraConfig = ''
      # colors (Broadcast theme)
      background            #1c1c1c
      foreground            #e5e1db

      # font config
      font_family      Operator Mono Book
      bold_font        Operator Mono Medium
      italic_font      Operator Mono Book Italic
      bold_italic_font Operator Mono Medium Italic

      disable_ligatures always

      font_size 11.0

      adjust_line_height 100%
      adjust_column_width 100%

      # adjust_baseline 5%

      symbol_map U+E0A0-U+E0A2,U+E0B0-U+E0B3 PowerlineSymbols


      # window config
      scrollback_lines 50000

      focus_follows_mouse no


      # misc config
      allow_remote_control yes

      enable_audio_bell no
      window_alert_on_bell yes
      bell_on_tab no

      copy_on_select no

      # open_url_modifiers kitty_mod
      open_url_with google-chrome-stable

      window_padding_width 10

      # use nvim as pager
      scrollback_pager nvim -c 'set ft=man'

      # don't do cursor blink
      cursor_blink_interval 0
    '';
  };
}
