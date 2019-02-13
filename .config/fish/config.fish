
# add rust binaries to path
set rust_bin "$HOME/.cargo/bin"
if test -d $rust_bin
  set -x PATH $PATH $rust_bin
end

# make directory colors nice
set -x LSCOLORS 'GxFxCxDxBxegedabagaced'

# customize prompt colors
set -x pure_color_current_folder (set_color brblue)
set -x pure_color_ssh_host $pure_color_yellow
set -x pure_color_ssh_user_normal $pure_color_magenta
set -x pure_color_virtualenv (set_color brgreen)

set -x EDITOR 'vim'
