#!/bin/sh

set -eu

# Prefix.
tmux unbind-key C-b
tmux set-option -g prefix C-a
tmux bind-key C-a send-prefix

# Set indices to start from 1.
tmux set-option -g base-index 1
tmux set-window-option -g pane-base-index 1

# Use emacs-style key bindings in the status line. This is already the default
# but is overriden in case of EDITOR or VISUAL are set to vi. This ensures we
# always use emacs-style.
tmux set-option -g status-keys emacs

# Monitor for activity in the window. Windows with activity are highlighted
# in the status line.
tmux set-option -g monitor-activity on

# If on, display a message instead of sending a bell when activity occurs in a
# window for which the monitor-activity window option is enabled.  If set to
# both, a bell and a message are produced.
tmux set-option -g visual-activity on

# Control automatic window renaming. When this setting is enabled, tmux will
# rename the window automatically using the format specified by
# automatic-rename-format. This flag is automatically disabled for an individual
# window when a name is specified at creation with new-window or new-session,
# or later with rename-window, or with a terminal escape sequence.
tmux set-window-option -g automatic-rename on

# When a window is closed in a session, automatically renumber the other
# windows in numerical order.
tmux set-option -g renumber-windows on

# Update the status line every 5 seconds. Default is 15 seconds. Might have to
# adjust this depending on how heavy my status bar is.
tmux set-option -g status-interval 5

# ------------------------------------------------------------------------------
# Mouse

tmux set-option -g mouse on

tmux bind-key t run-shell ~/.config/tmux/toggle-mouse.sh

# Important for visual flag segment in status.
tmux set-option -g @trallnag_mouse_mode_on 1

# ------------------------------------------------------------------------------
# Full sRGB colors

# Enable sRGB support. The terminal must support this for it to work.
# tmux set-option -g default-terminal screen-256color
tmux set-option -as terminal-features ",xterm*:RGB"

# ------------------------------------------------------------------------------
# Default command

# Don't perform login shell on new tabs and windows. The default is to start
# a login shell (for good reasons). Maybe I will switch back to the default.
# The default value is '' (empty string).
tmux set-option -g default-command $(basename $SHELL)

# ------------------------------------------------------------------------------
# Styling variable declarations

# Taken from Wikipedia.
alice_blue="#f0f8ff"
amethyst="#64609a"
byzantium="#702963"
celestial_blue="#4997d0"
cerulean_frost="#6d9bc3"
cinnamon_satin="#cd607e"
cornflower_blue="#6495ed"
deep_sky_blue="#00bfff"
walnut_brown="#5c5248"
duck_blue="#5C5248"
emerald="#14a989"
eminence="#6c3082"
independence="#4c516d"
indigo_dye="#00416a"
international_klein_blue="#002fa7"
japanese_violet="#5b3256"
jasper="#d05340"
lapis_lazuli="#26619c"
light_sky_blue="#87cefa"
magenta_haze="#9f4576"
malachite="#469496"
martinique="#3c3748"
moonstone="#3aa8c1"
mulled_wine="#54515b"
off_white="#faf9f6"
oxford_blue="#002147"
pansy_purple="#78184a"
periwinkle="#ccccff"
pink_pearl="#b07080"
quinacridone_magenta="#9a114f"
resene_gun_powder="#484753"
resene_space_cadet="#1e2952"
ruby="#aa4069"
rurikon="#224b8f"
sapphire="#0f52ba"
sapphire_blue="#0067a5"
seashell="#fff5ee"
silver_lake_blue="#5d89ba"
steel_blue="#4682b4"
tigers_eye="#b56917"
tyrian_purple="#66023c"
uranium_blue="#afdbf5"
vista_blue="#7c9ed9"
white="#ffffff"
nord0="#2e3440"
nord9="#81a1c1"
apricot="#fbceb1"
atomic_tangerine="#ff9966"
goldenrod="#daa520"
sandstone="#797067"
soft_amber="#d0bfb4"
wafer="#dbccc2"
alloy_orange="#c46210"

# Powerline.
pl_angle_left=""
pl_angle_left_thin=""
pl_angle_right=""
pl_angle_right_thin=""
pl_round_left=""
pl_round_left_thin=""
pl_round_right=""
pl_round_right_thin=""
pl_sharp_bottom_right=""
pl_sharp_bottom_left=""

# Powerline echos.
# pl_angle_left=$(echo -e "\ue0b2")
# pl_angle_left_thin=$(echo -e "\ue0b3")
# pl_angle_right=$(echo -e "\ue0b0")
# pl_angle_right_thin=$(echo -e "\ue0b1")
# pl_round_left=$(echo -e "\ue0b6")
# pl_round_left_thin=$(echo -e "\ue0b7")
# pl_round_right=$(echo -e "\ue0b4")
# pl_round_right_thin=$(echo -e "\ue0b5")
# pl_sharp_bottom_right=$(echo -e "\ue0b8")
# pl_sharp_bottom_left=$(echo -e "\ue0ba")

# Other Nerd Font symbols.
nf_fa_home=""
nf_mdi_home=""
nf_oct_home=""
nf_mdi_gamepad=""
nf_fa_list=""
nf_fa_map_signs=""
nf_fa_th=""
nf_fa_th_large=""
nf_fa_calendar=""
nf_fa_clock_o=""
nf_oct_calendar=""
nf_fa_user=""
nf_fa_arrow_up=""
nf_fa_mouse_pointer=""
nf_mdi_cursor_default_outline=""
nf_mdi_cursor_default=""
nf_fa_th=""
nf_fa_th_large=""
nf_fa_gear=""
nf_oct_sync=""
nf_fa_copy=""
nf_mdi_content_copy=""

# Other Nerd Font symbols.
# nf_fa_home=$(echo -e "\uf015")
# nf_mdi_home=$(echo -e "\uf7db")
# nf_oct_home=$(echo -e "\uf46d")
# nf_mdi_gamepad=$(echo -e "\uf795")
# nf_fa_list=$(echo -e "\uf03a")
# nf_fa_map_signs=$(echo -e "\uf277")
# nf_fa_th=$(echo -e "\uf00a")
# nf_fa_th_large=$(echo -e "\uf009")
# nf_fa_calendar=$(echo -e "\uf073")
# nf_fa_clock_o=$(echo -e "\uf017")
# nf_oct_calendar=$(echo -e "\uf455")
# nf_fa_user=$(echo -e "\uf007")
# nf_fa_arrow_up=$(echo -e "\uf062")
# nf_fa_mouse_pointer=$(echo -e "\uf245")
# nf_mdi_cursor_default_outline=$(echo -e "\uf6b4")
# nf_mdi_cursor_default=$(echo -e "\uf6b3")
# nf_fa_th=$(echo -e "\uf00a")
# nf_fa_th_large=$(echo -e "\uf009")
# nf_fa_gear=$(echo -e "\uf013")
# nf_oct_sync=$(echo -e "\uf46a")
# nf_fa_copy=$(echo -e "\uf0c5")
# nf_mdi_content_copy=$(echo -e "\uf68e")

# ------------------------------------------------------------------------------
# Segment builders

build_segment_mouse_mode() {
    local on_box_color="$tigers_eye"
    local on_box_content_color="$white"

    local off_box_color="$sandstone"
    local off_box_content_color="$wafer"

    local on_left="#[fg=$on_box_color bg=default]$pl_round_left"
    local on_centre="#[fg=$on_box_content_color bg=$on_box_color]$nf_mdi_cursor_default M"
    local on_right="#[fg=$on_box_color bg=default]$pl_round_right"
    local on="$on_left$on_centre$on_right "

    local off_left="#[fg=$off_box_color bg=default]$pl_round_left"
    local off_centre="#[fg=$off_box_content_color bg=$off_box_color]$nf_mdi_cursor_default M"
    local off_right="#[fg=$off_box_color bg=default]$pl_round_right"
    local off="$off_left$off_centre$off_right "

    printf '%s' "#{?@trallnag_mouse_mode_on,$on,$off}#[fg=default]"
}

build_segment_client_prefix() {
    local on_box_color="$tigers_eye"
    local on_box_content_color="$white"

    local off_box_color="$sandstone"
    local off_box_content_color="$wafer"

    local on_left="#[fg=$on_box_color bg=default]$pl_round_left"
    local on_centre="#[fg=$on_box_content_color bg=$on_box_color]$nf_fa_gear P"
    local on_right="#[fg=$on_box_color bg=default]$pl_round_right"
    local on="$on_left$on_centre$on_right "

    local off_left="#[fg=$off_box_color bg=default]$pl_round_left"
    local off_centre="#[fg=$off_box_content_color bg=$off_box_color]$nf_fa_gear P"
    local off_right="#[fg=$off_box_color bg=default]$pl_round_right"
    local off="$off_left$off_centre$off_right "

    printf '%s' "#{?client_prefix,$on,$off}#[fg=default]"
}

build_segment_pane_sync() {
    local on_box_color="$tigers_eye"
    local on_box_content_color="$white"

    local off_box_color="$sandstone"
    local off_box_content_color="$wafer"

    local on_left="#[fg=$on_box_color bg=default]$pl_round_left"
    local on_centre="#[fg=$on_box_content_color bg=$on_box_color]$nf_oct_sync S"
    local on_right="#[fg=$on_box_color bg=default]$pl_round_right"
    local on="$on_left$on_centre$on_right "

    local off_left="#[fg=$off_box_color bg=default]$pl_round_left"
    local off_centre="#[fg=$off_box_content_color bg=$off_box_color]$nf_oct_sync S"
    local off_right="#[fg=$off_box_color bg=default]$pl_round_right"
    local off="$off_left$off_centre$off_right "

    printf '%s' "#{?pane_synchronized,$on,$off}#[fg=default]"
}

build_segment_pane_in_mode() {
    local on_box_color="$tigers_eye"
    local on_box_content_color="$white"

    local off_box_color="$sandstone"
    local off_box_content_color="$wafer"

    local on_left="#[fg=$on_box_color bg=default]$pl_round_left"
    local on_centre="#[fg=$on_box_content_color bg=$on_box_color]$nf_mdi_content_copy C"
    local on_right="#[fg=$on_box_color bg=default]$pl_round_right"
    local on="$on_left$on_centre$on_right "

    local off_left="#[fg=$off_box_color bg=default]$pl_round_left"
    local off_centre="#[fg=$off_box_content_color bg=$off_box_color]$nf_mdi_content_copy C"
    local off_right="#[fg=$off_box_color bg=default]$pl_round_right"
    local off="$off_left$off_centre$off_right "

    printf '%s' "#{?pane_in_mode,$on,$off}#[fg=default]"
}

# ------------------------------------------------------------------------------
# Style base

# Activate second status line.
tmux set-option -g status 2

# General status style.
tmux set-option -g status-style "fg=$seashell,bg=$resene_gun_powder"

# Pane border.
tmux set-option -g pane-border-style "fg=$sapphire_blue"
tmux set-option -g pane-active-border-style "fg=$ruby"

# ------------------------------------------------------------------------------
# Style left status

tmux set-option -g status-left-length 20

tmux set-option -g status-left ""
alias add="tmux set-option -ga status-left"

add "#[fg=$apricot,bg=$walnut_brown] $nf_fa_home  "
add "#[fg=$ruby,bg=$walnut_brown]$pl_round_left"
add "#[fg=$white,bg=$ruby]#S"
add "#[fg=$ruby,bg=$walnut_brown]$pl_round_right  "
add "#[fg=$walnut_brown,bg=default]$pl_sharp_bottom_right"
add "#[fg=default,bg=default]"

# ------------------------------------------------------------------------------
# Style window list

# Put window list into centre.
tmux set-option -g status-justify absolute-centre

# Window status.
tmux set-window-option -g window-status-format "#[fg=$sapphire_blue,bg=default]$pl_round_left#[fg=$alice_blue,bg=$sapphire_blue]#I:#W#{p1:window_flags}#[fg=$sapphire_blue,bg=default]$pl_round_right#[fg=default,bg=default]"

# Window current status.
tmux set-window-option -g window-status-current-format "#[fg=$ruby,bg=default]$pl_round_left#[fg=$white,bg=$ruby]#I:#W#{p1:window_flags}#[fg=$ruby,bg=default]$pl_round_right#[fg=default,bg=default]"

# Prefix window list with glyph.
prefix="#[fg=$apricot]$nf_fa_th  "
old_status_format="$(tmux show-options -gv 'status-format[0]')"

if [ "$(tmux show-options -sv @trallnag_window_list_prefix)" = "" ]; then
    tmux set-option -s @trallnag_window_list_prefix 1
    new_status_format="$(echo $old_status_format | sed "s/#\[list=on\]/#\[list=on\]$prefix/g")"
    tmux set-option -g "status-format[0]" "$new_status_format"
fi

# ------------------------------------------------------------------------------
# Style right status

tmux set-option -g status-right-length 40

tmux set-option -g status-right ""
alias add="tmux set-option -ga status-right"

add "#[fg=$walnut_brown,bg=default]$pl_sharp_bottom_left"
add "#[fg=$apricot,bg=$walnut_brown]  $nf_fa_map_signs  "
add "#{P:"
add "#{?pane_active,#[fg=$ruby#,bg=$walnut_brown],#[fg=$sapphire_blue#,bg=$walnut_brown]}$pl_round_left"
add "#{?pane_active,#[fg=$white#,bg=$ruby],#[fg=$alice_blue#,bg=$sapphire_blue]}#{pane_index}"
add "#{?pane_active,#[fg=$ruby#,bg=$walnut_brown],#[fg=$sapphire_blue#,bg=$walnut_brown]}$pl_round_right"
add " "
add "}"

#
# Second status line
#

tmux set-option -g "status-format[1]" ""
alias add="tmux set-option -ga 'status-format[1]'"

add "#[fg=$seashell bg=$walnut_brown fill=$walnut_brown]"
add "#[push-default]"
add "#[align=centre]"
add "$(build_segment_client_prefix)"
add "$(build_segment_pane_in_mode)"
add "$(build_segment_pane_sync)"
add "$(build_segment_mouse_mode)#[fg=default bg=$walnut_brown]"
add "#[align=right]"
add "#[fg=$apricot]${nf_fa_user}#[fg=default] #(whoami)@#h   "
add "#[fg=$apricot]${nf_fa_arrow_up}#[fg=default] #(~/.config/tmux/uptime.sh)   "
add "#[fg=$apricot]${nf_fa_clock_o}#[fg=default] %H:%M   "
add "#[fg=$apricot]${nf_oct_calendar}#[fg=default] %a %b %F "

# ------------------------------------------------------------------------------
