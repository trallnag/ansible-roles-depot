#
# Here is how Zsh loads its configuration files:
#
# 1. `.zshenv`
# 2. `.zprofile` if login
# 3. `.zshrc` if interactive
# 4. `.zlogin` if login
# 5. `.zlogout`
#
# References:
#
# 1. https://linux.die.net/man/1/zshoptions
# 2. https://zsh.sourceforge.io/Intro/intro_3.html
#
# ------------------------------------------------------------------------------
#

source "$DOT_ZSH_ZLOGOUT_FILE"
