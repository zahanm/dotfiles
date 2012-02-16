
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# --- history
# don't put duplicate lines in the history.
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Alias utilities
alias eb='vi $HOME/.bashrc; source $HOME/.bashrc'

# ls options
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -Alh'

# grep options
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# git
export PAGER="less"
export EDITOR="vim"

# Stanford Kerberos
export KRB5_CONFIG="$HOME/.krb5.stanford.conf"

# Python
export PYTHONSTARTUP="$HOME/.py_startup"

# Ruby
export RUBYOPT=rubygems

# Load RVM into a shell session *as a function*
# and the check makes this machine independant
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# -- general stuffs

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Completion of ssh hosts
complete -W "$(echo `cat $HOME/.ssh/config | grep 'Host ' | cut -d ' ' -f 3`;)" ssh

# --- platform specific
OS=`uname`
case "$OS" in
  "Linux")
  # --- Assumed Ubuntu Linux

  # ls options
  alias ls='ls --color=auto'
  export LS_COLORS='di=00;93'

  # set variable identifying the chroot you work in (used in the prompt below)
  if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
      debian_chroot=$(cat /etc/debian_chroot)
  fi

  # make less more friendly for non-text input files, see lesspipe(1)
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

  # git
  source /etc/bash_completion.d/git
  export PS1='[${debian_chroot:+($debian_chroot)}\u@\h \W]$(__git_ps1 " (%s) ")\$ '

  ;;

  "Darwin")
  # --- Mac OS X

  # ls options
  alias ls='ls -G'
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

  # homebrew
  export PATH='/usr/local/bin':"$PATH"

  # git
  source /usr/local/etc/bash_completion.d/git-completion.bash
  export PS1='[\u@\h \W]$(__git_ps1 " (%s) ")\$ '

  # node.js and npm
  export NODE_PATH="/usr/local/lib/node_modules"

  # jslint conf
  alias jsl='jsl -conf $HOME/.jslint'

  ;;
esac

# --- host specific
HOST=`hostname -s`
case "$HOST" in
  "arya")

  # Alias utilities

  # dormouse server
  alias dormouserver='cd $HOME/jabberwocky/dormouse/dormouse-server;bundle exec rails server -p 3777'

  # Android dev
  export PATH=$PATH:"$HOME/Documents/ExternalLibs/android-sdk-linux_86/tools/"

  # App Engine dev
  export PATH=$PATH:"$HOME/Documents/ExternalLibs/google_appengine/"
  alias gappeng_server="$HOME/Documents/ExternalLibs/google_appengine/dev_appserver.py"
  alias gappeng_appcfg="$HOME/Documents/ExternalLibs/google_appengine/appcfg.py"

  # Rubygems setup to always be included
  export PATH=$PATH:/var/lib/gems/1.8/bin

  # ManReduce stuff as well
  export RUBYLIB=$RUBYLIB:"$HOME/jabberwocky/manreduce/lib"

  # Jabberwocky binaries folder
  export PATH=$PATH:"$HOME/jabberwocky/dormouse/dormouse-server/bin"
  export PATH=$PATH:"$HOME/jabberwocky/manreduce/bin"

  # Amazon EC2 dev
  export EC2_PRIVATE_KEY="$HOME/.ec2/nodesandbox_ec2.pem"

  # Node.js
  export NODE_ENV='development'

  ;;

  "brom")

  # Node.js
  export NODE_ENV='development'

  ;;

  "ip-10-244-178-215")

  if [ -f /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
  fi

  # Node.js
  export PATH='/node/bin':$PATH
  export NODE_PATH='/node/lib'
  export NODE_ENV='production'

  ;;

"zoster")

  # mongodb running locally
  alias mongodbrun='mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'

  # Node.js
  export NODE_ENV='development'

  ;;

esac
