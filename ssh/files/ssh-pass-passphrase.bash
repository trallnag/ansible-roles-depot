#!/usr/bin/env bash

# Parameter $1 passed to the script is the prompt text.
# READ Secret from STDIN and echo it.

read passphrase
echo "$passphrase"
