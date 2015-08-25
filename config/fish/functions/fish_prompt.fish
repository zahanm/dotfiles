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

  # jumping hoops for hg
  function find_hg_root
    set -l dir (pwd)
    set -e HG_ROOT

    while test $dir != "/"
      if test -f $dir'/.hg/dirstate'
        set -g HG_ROOT $dir"/.hg"
        return 0
      end

      set -l dir (dirname $dir)
    end

    return 1
  end

  set -l hg_branch
  if find_hg_root 2>&1
    set hg_branch ' ('(cat "$hg_root/branch" 2>/dev/null; or hg branch)')'
  end

  echo -n -s $user @ $host ' ' $cwd $git_branch $hg_branch $suffix ' '

end

