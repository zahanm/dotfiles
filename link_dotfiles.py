
from __future__ import print_function
import os
import os.path as path

# no readme, .git and script to be symlinked
excluded = frozenset(['.git', 'README.md', __file__])

def symlink_file(fname, repo, dest):
  target = path.join(repo, fname)
  link = path.join(dest, '.' + fname)
  if path.lexists(link):
    print('{0}: skipped, since link exists', link)
    return
  os.symlink(target, link)
  print(link)

def link_dotfiles():
  home = path.expanduser('~')
  dotfile_repo = path.dirname(path.abspath(__file__))
  for fname in os.listdir(dotfile_repo):
    if fname not in excluded:
      symlink_file(fname, dotfile_repo, home)

if __name__ == '__main__':
  link_dotfiles()
