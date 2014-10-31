#!/bin/bash

# bash_profile

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
	platform='osx'
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

declare -a files=(
    $HOME/dotfiles/bash_config    # Configuration
    $HOME/dotfiles/bash_aliases    # Aliases
    $HOME/dotfiles/bash_prompt    # Custom bash prompt
    $HOME/dotfiles/bash_paths    # Path modifications
    $HOME/dotfiles/bash_functions # Short functions for shell work
)

# If these files are readable, source them
for index in ${!files[*]}
do
    if [[ -r ${files[$index]} ]]; then
        source ${files[$index]}
    fi
done

unset files

#if [[ $platform == 'osx' ]]; then
#    PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
#    export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
#elif [[ $platform == 'linux' ]]; then
#    PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
#    export PROMPT_COMMAND="${PROMPT_COMMAND}; "
#fi





