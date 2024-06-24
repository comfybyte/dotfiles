{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g prefix C-s
      unbind C-b
      set -g base-index 1
      set -g pane-base-index 1

      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind c new-window -c "#{pane_current_path}"
      bind  %  split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"
      bind v set -g status


      # Theming
      set -g mode-style "fg=#E0DEF4,bg=#111111"

      set -g message-style "fg=#E0DEF4,bg=#111111"
      set -g message-command-style "fg=#E0DEF4,bg=#111111"

      set -g pane-border-style "fg=#111111"
      set -g pane-active-border-style "fg=#E0DEF4"

      set -g status "on"
      set -g status-justify "left"

      set -g status-style "fg=#E0DEF4,bg=#000000"

      set -g status-left-length "100"
      set -g status-right-length "100"

      set -g status-left-style NONE
      set -g status-right-style NONE

      set -g status-left "#[fg=#1b1d2b,bg=#E0DEF4,bold] <#S> "
      set -g status-right ""

      setw -g window-status-activity-style "underscore,fg=#828bb8,bg=#000000"
      setw -g window-status-separator ""
      setw -g window-status-style "NONE,fg=#828bb8,bg=#000000"
      setw -g window-status-format "#[fg=#888888,bg=#000000]  #W #I #F "
      setw -g window-status-current-format "#[fg=#E0DEF4,bg=#111111,bold]  #W #F "
    '';
  };
}
