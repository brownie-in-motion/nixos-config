{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        width = 300;
        height = 300;
        offset = "20x35";
        origin = "top-right";
        transparency = 10;
        separator_height = 1;
        frame_width = 1;
        padding = 10;
        horizontal_padding = 10;
        frame_color = "#313131";
        font = "Operator Mono Lig Book 10";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "top";
      };
      urgency_low = {
        background = "#222222";
        foreground = "#888888";
        timeout = 10;
      };
      urgency_normal = {
        background = "#222222";
        foreground = "#ffffff";
        timeout = 10;
      };
      urgency_critical = {
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
  };
}
