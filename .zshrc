#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# User configuration
# In an anonymous function to avoid leaking the local variables to the shell
function() {

  # add custom scripts to path
  scripts_bin="$HOME/.config/bin"
  [[ -d $scripts_bin ]] && PATH="$PATH:$scripts_bin"

  # add rust binaries to path
  rust_bin="$HOME/.cargo/bin"
  [[ -d $rust_bin ]] && PATH="$PATH:$rust_bin"

  android_sdk="$HOME/Library/Android/sdk"
  if [[ -d $android_sdk ]]; then
    export ANDROID_SDK=$android_sdk
    export ANDROID_HOME=$android_sdk
    PATH="$PATH:$android_sdk/tools:$android_sdk/platform-tools"
  fi

  android_ndk='/opt/android_ndk'
  [[ -d $android_ndk ]] && export ANDROID_NDK_REPOSITORY=$android_ndk

  fbsource_dir="$HOME/source/fbsource"
  if [[ -d $fbsource_dir ]]; then
    export FBANDROID_DIR="$fbsource_dir/fbandroid"
    export FBOBJC_DIR="$fbsource_dir/fbobjc"
    export XPLAT_DIR="$fbsource_dir/xplat"
  fi

  pybase=$(python3 -m site --user-base)
  [[ -d "$pybase/bin" ]] && PATH="$PATH:$pybase/bin"

  onepassword="$HOME/.1password"
  [[ -d $onepassword ]] && export SSH_AUTH_SOCK="$onepassword/agent.sock"

  # fnm
  if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env)"
  fi

  if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  ##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW

    # iTerm2 Shell integration
    iterm2="$HOME/.iterm2_shell_integration.zsh"
    [[ -e $iterm2 ]] && source $iterm2

    # POWERLEVEL10K
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  ##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi
}
