
# add rust binaries to path
set rust_bin "$HOME/.cargo/bin"
if test -d $rust_bin
  set -x PATH $PATH $rust_bin
end

# add vscode binaries to path
set vscode_bin "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
if test -d $vscode_bin
  set -x PATH $PATH $vscode_bin
end

# add custom scripts to path
set scripts_bin "$HOME/.config/bin"
if test -d $scripts_bin
  set -x PATH $PATH $scripts_bin
end

# make directory colors nice
set -x LSCOLORS 'GxFxCxDxBxegedabagaced'

set -x EDITOR 'vim'

# chef is not doing a great job of setting these
# copied from ~/.fbchef/environment
set android_sdk '/opt/android_sdk'
if test -d $android_sdk
  set -x ANDROID_SDK $android_sdk
  set -x ANDROID_HOME $android_sdk
  set -x PATH $PATH "$android_sdk/tools" "$android_sdk/platform-tools"
end

set android_ndk '/opt/android_ndk'
if test -d $android_ndk
  set -x ANDROID_NDK_REPOSITORY $android_ndk
end

set fbsource_dir "$HOME/source/fbsource"
if test -d $fbsource_dir
  set -x FBANDROID_DIR "$fbsource_dir/fbandroid"
  set -x FBOBJC_DIR "$fbsource_dir/fbobjc"
  set -x XPLAT_DIR "$fbsource_dir/xplat"
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set homebrew "$HOME/homebrew"
if test -d $homebrew
  set -x PATH $homebrew/bin $homebrew/sbin $PATH
end

set pybase (python3 -m site --user-base)
if test -d $pybase
  set -x PATH $pybase/bin $PATH
end

set 1password "$HOME/.1password"
if test -d $1password
  set -x SSH_AUTH_SOCK $1password/agent.sock
end
