#!/bin/sh

old=$(tmux show -gv mouse)
new=

if [ $old = on ]; then
    new=off
    tmux set-option -g @trallnag_mouse_mode_on 0
else
    new=on
    tmux set-option -g @trallnag_mouse_mode_on 1
fi

tmux set-option -g mouse $new
