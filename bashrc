# Aliases
alias eb='vi ~/.bashrc; source ~/.bashrc'
alias grep='grep --color=auto'

# ls options
alias ls='ls -G'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# git
export PAGER="less"
export EDITOR="vim"
source /usr/local/bin/git-completion.bash
export PS1='[\u@\h \W]$(__git_ps1 " (%s) ")\$ '

# Python
export PYTHONSTARTUP='/Users/zahanm/.py_startup'

# Node
export NODE_PATH='/usr/local/lib/node_modules'

# Completion of ssh hosts
complete -W "$(echo `cat ~/.ssh/config | grep 'Host ' | cut -d ' ' -f 3`;)" ssh

# History
export HISTCONTROL=erasedups
shopt -s histappend

# Stanford Kerberos
export KRB5_CONFIG="$HOME/.krb5/stanford.conf"

# jslint conf
alias jsl='jsl -conf ~/.jslint'

# homebrew
export PATH='/usr/local/bin':$PATH

