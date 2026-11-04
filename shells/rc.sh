#!/bin/sh
#
# Copyright (c) 2026 Institut des Géosciences de l'Environnement, Grenoble.
#
# License: BSD 3-Clause "New" or "Revised" License (BSD-3-Clause).

# We set "strict" default permissions (this should be standard, shouldn'it?)
umask 077

# Basic aliases
alias e="emacs -nw"
alias re="%emacs"
alias v="vim"
alias gst="git status"
alias gbr="git branch"
alias gco="git checkout"
alias grm="git remote"
alias eee="micromamba activate everything"

function gcm {
    # Convenience function for quick git commit without opening text editor.
    #
    # Usage:
    #
    # $> gcm # This is a regular git commit
    #
    # $> gcm my commit message
    #
    if [ $# -lt 1 ]; then
        git commit
        return $?
    else
        msg=""
        first=true
        for arg in "$@"; do
            if [ "${first}" = "true" ]; then
                first=false
            else
                msg="${msg} "
            fi
            msg="${msg}${arg}"
        done
        git commit -m "${msg}"
        return $?
    fi
}

if [ "$(uname -o)" = "Darwin" ]; then
    alias man="LANG='en_US.UTF-8' man"
    alias l="ls -lhG"
elif [ "$(uname -o)" = "GNU/Linux" ]; then
    alias l="ls -lh --group-directories-first --color=auto"
fi

# Homebrew configuration
HOMEBREW_NO_ENV_HINTS=1
