function myles -d "Search by filename"
  if test (pwd) != "$HOME/source/fbsource"
    echo "Must be in fbsource to run this"
    return
  end
  set EDITOR 'studio --wait'
  xplat/tools/myles $argv
end
