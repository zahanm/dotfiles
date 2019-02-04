function beancount -d "Prepare to count some beans"
  cd /Users/zahanm/source/collect-beans/
  command pwd
  pipenv shell # this must be the last command, since it spawns a new shell
end
