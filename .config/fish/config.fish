
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

set -x EDITOR 'vim'
