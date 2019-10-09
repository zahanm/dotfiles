
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

# make directory colors nice
set -x LSCOLORS 'GxFxCxDxBxegedabagaced'

# customize prompt colors
set -x pure_color_current_folder (set_color brblue)
set -x pure_color_ssh_host $pure_color_yellow
set -x pure_color_ssh_user_normal $pure_color_magenta
set -x pure_color_virtualenv (set_color brgreen)

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

