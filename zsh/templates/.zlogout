# ------------------------------------------------------------------------------
# Fileinfo


# Here is how Zsh loads its configuration files:
#   1) .zshenv
#   2) .zprofile if login
#   3) .zshrc if interactive
#   4) .zlogin if login
#   5) .zlogout

# Online man page: https://linux.die.net/man/1/zshoptions


# ------------------------------------------------------------------------------
# Goodbye


# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {
    echo "We will meet again" | cowsay | lolcat
    sleep 1
} >&2


# ------------------------------------------------------------------------------


source "{{ zsh_zlogout_bottom }}"


# ------------------------------------------------------------------------------
