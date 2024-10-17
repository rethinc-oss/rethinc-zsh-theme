# -*- mode: sh; -*-
# vim: set ft=sh :
# Rethinc Theme v0.1.0
#
# https://github.com/rethinc-oss/rethinc-zsh-theme
#

# Initialization {{{
setopt PROMPT_SUBST
PROMPT=''
# }}}

# User context segment {{{
dracula_context() {
    if [[ -n "${SSH_CONNECTION-}${SSH_CLIENT-}${SSH_TTY-}" ]] || (( EUID == 0 )); then
        echo '%n@%m '
    else
        echo '%n '
    fi
}
PROMPT+='%F{015}%B$(dracula_context)'
# }}}

# Directory segment {{{
PROMPT+='%F{003}%B%~ '
# }}}


# Git branch/tag segment {{{
PROMPT+='%F{008}[${GIT_PROMPT_KIT_HEAD:+$GIT_PROMPT_KIT_HEAD}${GIT_PROMPT_KIT_TAG}%F{008}] '
# }}}

# Status segment {{{
PROMPT+='%F{015}%#%(?. .!) %{$reset_color%}'
# }}}

# Configure 'ls' colors
export LS_COLORS=$LS_COLORS:'no=00:di=00;33:ln=target:ex=01;37'
