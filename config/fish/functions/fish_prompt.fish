function fish_prompt --description 'Write out the prompt'

  set -l color_cwd
  set -l suffix
  switch $USER
  case root toor
    set color_cwd red
    set suffix '#'
  case '*'
    set color_cwd green
    set suffix '>'
  end

  set -l user (set_color green) "$USER" (set_color normal)
  set -l host (set_color cyan) (hostname | cut -d . -f 1) (set_color normal)
  set -l cwd (set_color $color_cwd) (prompt_pwd) (set_color normal)
  set -l git_branch (__fish_git_prompt)

  echo -n -s $user @ $host ' ' $cwd $git_branch $suffix ' '

end

