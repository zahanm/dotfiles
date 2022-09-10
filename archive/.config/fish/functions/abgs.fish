function abgs -d "Search abgs (remote)" -a query -a choice
  if test (count $argv) -gt 1
    # The awk command picks the n-th line
    /opt/facebook/bin/biggrep/abgs --stripdir --files-with-matches $query | awk "NR == $choice" | xargs studio
  else
    /opt/facebook/bin/biggrep/abgs $query
  end
end
