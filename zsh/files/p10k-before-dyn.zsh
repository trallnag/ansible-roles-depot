#!/usr/bin/env zsh


# ------------------------------------------------------------------------------


typeset -g POWERLEVEL9K_HOME_ICON=
typeset -g POWERLEVEL9K_HOME_SUB_ICON=
typeset -g POWERLEVEL9K_FOLDER_ICON=

typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=

typeset -g POWERLEVEL9K_ANACONDA_PREFIX='%fin '
typeset -g POWERLEVEL9K_ANACONDA_VISUAL_IDENTIFIER_EXPANSION=''


# ------------------------------------------------------------------------------


typeset -g POWERLEVEL9K_TOP_LEFT_PROMPT_ELEMENTS=(
    dir
    vcs
)

typeset -g POWERLEVEL9K_BOTTOM_LEFT_PROMPT_ELEMENTS=(
    prompt_char
)

typeset -g POWERLEVEL9K_TOP_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
    direnv
    asdf
    virtualenv
    anaconda
    pyenv
    goenv
    nodenv
    nvm
    nodeenv
    node_version
    go_version
    rust_version
    dotnet_version
    php_version
    laravel_version
    java_version
    rbenv
    rvm
    fvm
    luaenv
    jenv
    plenv
    phpenv
    scalaenv
    kubecontext
    terraform
    aws
    azure
    gcloud
    ranger
    nnn
    xplr
    midnight_commander
)

typeset -g POWERLEVEL9K_BOTTOM_RIGHT_PROMPT_ELEMENTS=()


# ------------------------------------------------------------------------------
