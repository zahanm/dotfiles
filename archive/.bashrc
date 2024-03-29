
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# facebook
if [[ -s "/mnt/vol/engshare/admin/scripts/master.bashrc" ]]; then

  source "/etc/bashrc"
  source "/mnt/vol/engshare/admin/scripts/master.bashrc"
  export HIVE_RLWRAP=true
  source "$ADMIN_SCRIPTS/hive.include"

  alias node="/home/engshare/third-party-tools/node/bin/node"
  alias tlocal="t --test-flags 'webdriver-server=localhost' --test-flags 'webdriver-browser=chrome'"
  alias tstayopen="t --test-flags 'webdriver-server=localhost' --test-flags 'webdriver-stay-open=true' --test-flags 'webdriver-browser=chrome'"

  # chef
  export PATH=/opt/chef/bin/:$PATH

  # remote TextMate
  if [ -s "$HOME/rmate" ]; then
    PATH=$PATH:"$HOME/rmate"
  fi

  # custom scripts
  if [ -s "$HOME/devscripts" ]; then
    PATH=$PATH:"$HOME/devscripts"
  fi

  echo
  echo " |=====   |====|   |=====   |======   |=====|   |=====|   |=====|   |  / "
  echo " |        |    |   |        |         |     |   |     |   |     |   | / "
  echo " |====    |====|   |        |=====    |====|    |     |   |     |   |> "
  echo " |        |    |   |        |         |     |   |     |   |     |   | \ "
  echo " |        |    |   |=====   |======   |=====|   |=====|   |=====|   |  \ "
  echo

fi

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
alias stupidssh="ssh -o 'UserKnownHostsFile=/dev/null' -o 'StrictHostKeyChecking=no'"

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

# Python
export PYTHONSTARTUP="$HOME/.py_startup"

# Ruby
export RUBYOPT=rubygems

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Completion of ssh hosts
complete -W "$(echo `cat $HOME/.ssh/config | grep 'Host ' | grep -v "*" | cut -d ' ' -f 2`;)" ssh

# AWS management config
[[ -s $HOME/.ssh/aws.bash ]] && source $HOME/.ssh/aws.bash

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
  [[ -s /etc/bash_completion.d/git-prompt ]] && source /etc/bash_completion.d/git-prompt
  export PS1='[${debian_chroot:+($debian_chroot)}\u@\h \W]$(__git_ps1 " (%s) ")\$ '

  # mercurial
  [[ -s /etc/bash_completion.d/mercurial.sh ]] && source /etc/bash_completion.d/mercurial.sh

  # Node.js
  export NODE_ENV='production'

  ;;

  "Darwin")
  # --- Mac OS X

  # ls options
  alias ls='ls -G'
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

  # homebrew
  PATH="/usr/local/bin":$PATH

  # git
  source "/usr/local/etc/bash_completion.d/git-completion.bash"
  source "/usr/local/etc/bash_completion.d/git-prompt.sh"
  export PS1='[\u@\h \W]$(__git_ps1 " (%s) ")\$ '

  # node.js and npm
  export NODE_PATH="/usr/local/lib/node_modules"
  export NODE_ENV="development"
  PATH=$PATH:"/usr/local/share/npm/bin"

  export NODE_REPL_HISTORY_FILE="$HOME/.node_repl_history.json"

  # jslint conf
  alias jslint='jslint --indent 2 --browser --nomen'

  # redis running locally
  alias redisrun='redis-server /usr/local/etc/redis.conf'

  # dog executable
  if [[ -s "$HOME/Documents/Research/langdog/bin/dog.rb" ]]; then
    alias dog="ruby $HOME/Documents/Research/langdog/bin/dog.rb"
  fi

  # Load RVM into a shell session *as a function*
  # and the check makes this machine independant
  if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
    # Add RVM to PATH for scripting
    PATH=$PATH:"$HOME/.rvm/bin"
  fi

  # java and scala
  export JAVA_HOME="$(/usr/libexec/java_home)"
  [[ -s "/usr/local/etc/bash_completion.d/scala" ]] && source "/usr/local/etc/bash_completion.d/scala"

  # android
  if [ -d "/Users/zahanm/Documents/Opensource/android-sdk-macosx" ]; then
    export ANDROID_SDK="/Users/zahanm/Documents/Opensource/android-sdk-macosx"
    PATH=$PATH:"/Users/zahanm/Documents/Opensource/android-sdk-macosx/tools"
    PATH=$PATH:"/Users/zahanm/Documents/Opensource/android-sdk-macosx/platform-tools"
  fi
  if [ -d "/Users/zahanm/Documents/Opensource/android-ndk-r8d" ]; then
    export ANDROID_NDK="/Users/zahanm/Documents/Opensource/android-ndk-r8d"
  fi

  # ec2
  export EC2_PRIVATE_KEY="$HOME/.ec2/pk-zahanm.pem" # "$HOME/.ec2/pk-babelon.pem"
  export EC2_CERT="$HOME/.ec2/cert-zahanm.pem" # "$HOME/.ec2/cert-babelon.pem"
  export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
  export EC2_URL="https://ec2.amazonaws.com"

  # facebook

  webdriverdir='/Users/zahanm/Documents/Facebook/webdriver'
  if [ -d "$webdriverdir" ]; then
    alias webdriver="cd $webdriverdir && ./run.sh -s www.zahanm.sb.facebook.com selenium"
  fi

  # added by setup_fb4a.sh
  android_sdk='/opt/android_sdk'
  if [ -d "$android_sdk" ]; then
    export ANDROID_SDK=$android_sdk
    export ANDROID_HOME=${ANDROID_SDK}
    export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools
  fi
  android_ndk='/opt/android_ndk'
  if [ -d "$android_ndk" ]; then
    export ANDROID_NDK_REPOSITORY=$android_ndk
  fi

  ;;
esac

# --- host specific
HOST=`hostname -s`
case "$HOST" in
  "arya")
  # home server

  # dormouse server
  alias dormouserver='cd $HOME/jabberwocky/dormouse/dormouse-server;bundle exec rails server -p 3777'

  # Android dev
  PATH=$PATH:"$HOME/Documents/ExternalLibs/android-sdk-linux_86/tools/"

  # App Engine dev
  PATH=$PATH:"$HOME/Documents/ExternalLibs/google_appengine/"
  alias gappeng_server="$HOME/Documents/ExternalLibs/google_appengine/dev_appserver.py"
  alias gappeng_appcfg="$HOME/Documents/ExternalLibs/google_appengine/appcfg.py"

  # Rubygems setup to always be included
  PATH=$PATH:/var/lib/gems/1.8/bin

  # ManReduce stuff as well
  export RUBYLIB=$RUBYLIB:"$HOME/jabberwocky/manreduce/lib"

  # Jabberwocky binaries folder
  PATH=$PATH:"$HOME/jabberwocky/dormouse/dormouse-server/bin"
  PATH=$PATH:"$HOME/jabberwocky/manreduce/bin"

  # Amazon EC2 dev
  export EC2_PRIVATE_KEY="$HOME/.ec2/nodesandbox_ec2.pem"

  # Node.js
  export NODE_ENV='development'

  ;;

  "zahanm-mba")
  # facebook work laptop
  ;;

  "zoster")
  # home laptop

  # Stanford Kerberos
  export KRB5_CONFIG="$HOME/.krb5.stanford.conf"

  ;;
esac

# More Facebook
if [ -f /mnt/vol/engshare/admin/scripts/scm-prompt ]; then
  source /mnt/vol/engshare/admin/scripts/scm-prompt
  export PS1='[${debian_chroot:+($debian_chroot)}\u@\h \W]$(_dotfiles_scm_info) \$ '
fi

export PATH=$PATH
