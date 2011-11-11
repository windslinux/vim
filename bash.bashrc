#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

PS1='[\[\e[32;1m\]\u\[\e[m\]:\[\e[33m\]\W\[\e[m\]]\$ '
export PS1
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias cdl7='cd /home/xdzhou/l7detect'
alias rm='rm -i'
alias cp='cp -i'
[ -r /etc/bash_completion   ] && . /etc/bash_completion


