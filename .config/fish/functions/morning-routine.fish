function morning-routine -d "Pull, update, focus, and build"
  pushd $HOME/source/fbsource
  if test (hg status | wc -l) -gt 0
    echo "Abort! You have un-committed changes."
    return 1
  end
  hg pull
  and hg update fbandroid/stable
  and arc focus-android --targets threadsapp --pinned //fbandroid/java/com/instagram/threadsapp/
  and buck build threadsapp
  popd
end
