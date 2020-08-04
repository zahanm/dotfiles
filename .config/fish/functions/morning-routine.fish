function morning-routine -d "Pull, update, focus, and build"
  pushd $HOME/source/fbsource
  if test (hg status | wc -l) -gt 0
    echo "Abort! You have un-committed changes."
    return 1
  end
  if test (hg log -r ". % master" | wc -l) -gt 0; and not contains -- --rebase $argv
    echo "Abort! You have local commits and didn't use --rebase."
    return 1
  end
  hg pull; or return 2
  if contains -- --rebase $argv
    hg rebase --dest fbandroid/stable --base .
  else
    hg update fbandroid/stable
  end
  and arc focus-android --targets threadsapp --pinned //fbandroid/java/com/instagram/threadsapp/
  and buck build threadsapp
  popd
end
