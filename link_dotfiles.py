
from __future__ import print_function
import argparse
import os
import os.path as path

EXCLUDED = frozenset(['.git', 'README.md', 'archive', __file__])
FOR_REAL = False


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
                if not FOR_REAL:
                    print('DRY RUN: mkdir {0}'.format(dest))
                else:
                    os.mkdir(dest)
            link_dotfiles(src, dest)


def symlink_file(fname, src, dest):
    src_file = path.join(src, fname)
    dest_link = path.join(dest, '.' + fname)
    if path.lexists(dest_link):
        print('{0}: skipped, since dest exists'.format(dest_link))
        return
    if not FOR_REAL:
        print('DRY RUN: ln -s {0} {1}'.format(src_file, dest_link))
    else:
        os.symlink(src_file, dest_link)
        print('Linked {0}'.format(dest_link))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Link dotfiles.')
    parser.add_argument('--for-real', help='Makes the filesystem changes', action='store_true')
    args = parser.parse_args()
    if args.for_real:
        FOR_REAL = True
    dotfile_repo = path.dirname(path.abspath(__file__))
    home = path.expanduser('~')
    link_dotfiles(dotfile_repo, home)
