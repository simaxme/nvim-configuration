#!/bin/bash

[ -z "$TMUX"  ] && [ -n "$KITTY_TMUX" ] && { 
    if tmux has-session 2>/dev/null; then
        echo "There already is existing an existing session. Do you want to continue it?"
        read response

        echo "$response"

        test="hallo"
        test2="tets"

        if [ "$response" = "yes" ]; then
            exec tmux attach && exit 1
        else
            exec tmux new-session && exit 1
        fi
    else
        exec tmux new-session && exit 1
    fi
}
