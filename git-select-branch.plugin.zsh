# -*- mode: sh; sh-indentation: 4; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# Copyright (c) 2022 Wonwoo Choi

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */git-select-branch ]] {
    if [[ -z ${path[(r)${0:h}]} ]]; then
        path+=( "${0:h}" )
    fi
    if [[ -z ${fpath[(r)${0:h}]} ]]; then
        fpath+=( "${0:h}" )
    fi
    if [[ -z ${fpath[(r)${0:h}/completions]} ]]; then
        fpath+=( "${0:h}/completions" )
    fi
}

# Standard hash for plugins, to not pollute the namespace
typeset -gA Plugins
Plugins[GIT_SELECT_BRANCH_DIR]="${0:h}"

autoload -Uz git-select-branch

# Use alternate vim marks [[[ and ]]] as the original ones can
# confuse nested substitutions, e.g.: ${${${VAR}}}

# vim:ft=zsh:tw=80:sw=4:sts=4:et:foldmarker=[[[,]]]
