function morning-routine -d "Pull, update, focus, and build"
  pushd $HOME/source/fbsource
  hg pull
  and hg update fbandroid/stable
  and arc focus-android --targets threadsapp --pinned //fbandroid/java/com/instagram/threadsapp/
  and buck build threadsapp
  popd
end
