function bean-shell -d "Prepare to count some beans"
  pushd /Users/zahanm/source/collect-beans/
  command pwd
  pipenv shell # this must be the last command, since it spawns a new shell
  popd
end
