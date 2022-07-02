#!/bin/sh

usage() {
    cat <<EOF
Sign a temporary file to trigger gpg-agent caching.

Usage:
    $0 <fingerprint>

Examples:
    $0 ACCB8F306184BEEE49E7370E5DBF2C327E72AA3F
EOF
}

case $1 in help | -h | -help | --help) usage && exit ;; esac

# ------------------------------------------------------------------------------

if [ -z "$1" ]; then
    echo "[ERROR] Fingerprint must be provided."; usage; exit 1
else
    id="$1"
fi

set -eu

unen_file=/tmp/gpg-agent-dummy-sign-file-unencrypted
en_file=/tmp/gpg-agent-dummy-sign-file-encrypted

echo $(openssl rand -base64 12) | sha512sum > $unen_file

rm -f $en_file

gpg --yes -s -u $id $unen_file > $en_file

rm $unen_file
