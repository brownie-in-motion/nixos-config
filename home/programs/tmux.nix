{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-Space";
    historyLimit = 10000;
    extraConfig = ''
      # reloading
      bind r source-file ~/.config/tmux/tmux.conf \; display "reloaded"

      # clipboard
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel \
          ; run -b "tmux save-buffer - | xclip -sel clip -i > /dev/null"

      # movement
      unbind Left
      unbind Down
      unbind Up
      unbind Right

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # open panes in current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # status bar
      set -g default-terminal "screen-256color"
      set -g status-bg color145
      set -g status-fg color235
      set -g pane-active-border-style fg=color243
    '';
  };
}
