
# add rust binaries to path
set rust_bin "$HOME/.cargo/bin"
if test -d $rust_bin
  set -x PATH $PATH $rust_bin
end

# make directory colors nice
set -x LSCOLORS 'GxFxCxDxBxegedabagaced'

set -x EDITOR 'vim'
