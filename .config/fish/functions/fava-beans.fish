function fava-beans -d "Load up fava and get ready to analyse beancount"
  pushd /Users/zahanm/source/accounts
  pipenv run fava personal.beancount
  popd
end
