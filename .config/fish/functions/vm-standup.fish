function vm-standup -d "Give the order for today's stand-up"
  command python3 -c 'peeps = ["Zahan", "Michael", "Mark", "Ardavan"]; import random; print(random.sample(peeps, k=len(peeps)))'
end
