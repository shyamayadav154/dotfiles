#!/bin/sh
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Desktop/learning ~/Downloads ~/Desktop/work ~/Desktop/work/projects ~/Desktop ~/.config ~/.local ~/.local/**/** -mindepth 1 -maxdepth 1 -type d | fzf --height 100% --border --prompt="Select a project: " )
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

 # if not tmux session 
if [[ -z $TMUX ]]; then
    tmux attach-session -t $selected_name
    exit 0
fi

tmux switch-client -t $selected_name
