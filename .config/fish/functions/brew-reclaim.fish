function brew-reclaim -d "Take back ownership, chown /usr/local for brew to work"
  command sudo chown -R (whoami) /usr/local/bin /usr/local/lib /usr/local/sbin
end
