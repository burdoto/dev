#!/bin/bash

# Start a new tmux session named "monitoring"
tmux new-session -d -s monitoring

# Panel 1 (Top panel): Run htop locally and retry if it fails
#tmux send-keys 'while true; do htop; sleep 1; done' C-m

# Split window vertically to create Panel 2 (Remote)
#tmux split-window -v
#tmux send-keys 'while true; do ssh -t 192.168.0.8 "htop"; sleep 1; done' C-m

# Split the top panel horizontally to create Panel 5 (connects to 192.168.0.8)
#tmux split-window -h
tmux send-keys 'while true; do ssh -t gman.comroid.org "htop -s PERCENT_CPU"; sleep 1; done' C-m

# Split window vertically to create Panel 3 (Remote)
tmux split-window -h
tmux send-keys 'while true; do ssh -t host.ampznetwork.com "htop -s PERCENT_CPU"; sleep 1; done' C-m

# Split window vertically to create Panel 4 (Remote)
tmux split-window -v
tmux send-keys 'while true; do ssh -t warmulla.kaleidox.de "htop -s PERCENT_CPU"; sleep 1; done' C-m

# Split the top panel horizontally to create Panel 5 (connects to 192.168.0.8)
#tmux select-pane -t 0
#tmux split-window -h
#tmux send-keys 'while true; do ssh -t 192.168.0.9 "htop"; sleep 1; done' C-m

# Adjust layout to ensure vertical split on panels 2-4 and horizontal split on panel 5
tmux select-layout even-vertical

# Attach to the session
tmux attach-session -t monitoring
