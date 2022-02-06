
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

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
