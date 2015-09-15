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
alias tma='tmux attach'
alias cdb='cd /home/windslinux/software/board/ '
alias cdc='cd /home/windslinux/code '
alias cdp='cd /home/windslinux/code/pcr '
alias cdy='cd /home/windslinux/code/youke_ARM/kernel '
alias cdz='cd /home/windslinux/code/zaide'
[ -r /etc/bash_completion   ] && . /etc/bash_completion

