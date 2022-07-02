#!/bin/sh

usage() {
    cat <<EOF
Restart gpg-agent.
EOF
}

case $1 in help | -h | -help | --help) usage && exit ;; esac

# ------------------------------------------------------------------------------

set -eu

gpg-connect-agent reloadagent /bye
