
from __future__ import print_function
import os
import os.path as path

EXCLUDED = frozenset(['.git', 'README.md', 'archive', __file__])


def link_dotfiles(src_dir, dest_dir):
    for fname in os.listdir(src_dir):
        if fname in EXCLUDED:
            continue
        src = path.join(src_dir, fname)
        if path.isfile(src):
            symlink_file(fname, src_dir, dest_dir)
        # explore recursive directories
        if path.isdir(src):
            dest = path.join(dest_dir, fname)
            if not path.isdir(dest):
                os.mkdir(dest)
            link_dotfiles(src, dest)


def symlink_file(fname, src, dest):
    target = path.join(src, fname)
    link = path.join(dest, '.' + fname)
    if path.lexists(link):
        print('{0}: skipped, since link exists'.format(link))
        return
    os.symlink(target, link)
    print(link)


if __name__ == '__main__':
    dotfile_repo = path.dirname(path.abspath(__file__))
    home = path.expanduser('~')
    link_dotfiles(dotfile_repo, home)
