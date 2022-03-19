#remap prefix to Control + a
set -g prefix C-a
# bind 'C-a C-a' type 'C-a'
bind C-a send-prefix
unbind C-b
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'thewtex/tmux-mem-cpu-load'
run '~/.tmux/plugins/tpm/tpm'
#------------------------------------------------------------------------------
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M
#------------------------------------------------------------------------------
set -g default-command /bin/fish
set-option -g status on
set-option -g status-interval 2
set-option -g status-justify left
set-option -g status-keys vi
set-option -g status-position bottom
set-option -g status-style fg=green,bg=colour235
set-option -g status-left-length 20
set-option -g status-left-style default
set-option -g status-right-length 200 
set-option -g status-right-style default
set-option -g status-right "#[fg=green]#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load) "
#set-option -ag status-right "#[fg=red,dim,bg=default]#(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',') "
set-option -ag status-right " #[fg=green,bg=default]| %a%l:%M %p | %Y-%m-%d | #(whoami)"
set-window-option -g window-status-style fg=colour244
set-window-option -g window-status-style bg=default
set-window-option -g window-status-current-style fg=colour166
set-window-option -g window-status-current-style bg=default


# key bindings
bind \\ split-window -h
bind - split-window -v
bind [ next-window
bind ] previous-window

set -g default-terminal "screen-256color"
