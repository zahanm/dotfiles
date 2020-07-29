function bear-tracks -d "CLI controls for Bear.app"
  pushd /Users/zahanm/source/bear-tracks/
  yarn ts-node --script-mode index.ts $argv
  popd
end
