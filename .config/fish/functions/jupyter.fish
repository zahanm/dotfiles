function jupyter -d "Run Jupyter Lab server and launch interface"
  pushd /Users/zahanm/source/jupyterlab
  pipenv run jupyter lab
  popd
end
