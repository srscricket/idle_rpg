#!/bin/fish

set SESSIONNAME idle_rpg
tmux has-session -t $SESSIONNAME &>/dev/null

if [ $status ]
    tmux new-session -s $SESSIONNAME -n script -d
    tmux rename-window nvim
    tmux send-keys -t $SESSIONNAME:nvim nvim C-m

    # Create a second window named "compile"
    tmux new-window -t $SESSIONNAME -n compile

    # Create a third window named "fish"
    tmux new-window -t $SESSIONNAME -n fish
end

tmux attach -t $SESSIONNAME
