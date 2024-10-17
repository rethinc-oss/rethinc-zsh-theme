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
LS_COLORS=${(*)LS_COLORS/no=[^:]#/no=00}
LS_COLORS=${(*)LS_COLORS/di=[^:]#/di=00;33}
LS_COLORS=${(*)LS_COLORS/ln=[^:]#/ln=target}
LS_COLORS=${(*)LS_COLORS/ex=[^:]#/ex=01;37}
export LS_COLORS

# Configure completion colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
