#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
import os
import sys

myname = os.path.basename(__file__)
mypath = os.path.realpath(os.path.dirname(__file__))
exclude_list = ['Makefile', 'emacs.d']

#_______________________________________________________________________________
def is_excluded(path):
  for l in exclude_list:
    if path == l:
      return True
  return False

#_______________________________________________________________________________
def make_link():
  print(myname, mypath)
  for d in os.listdir(mypath):
    if (not os.path.isdir(d)
        or d[0] == '.'
        or is_excluded(d)):
      continue
    print(d + '/')
    for f in os.listdir(os.path.join(mypath, d)):
      # print(' - ' + f)
      fullpath = os.path.join(mypath, d, f)
      make_one_link(fullpath)

#_______________________________________________________________________________
def make_one_link(src, dst=os.path.expanduser('~'), option=''):
  dst = os.path.join(dst, '.' + os.path.basename(src))
  command = 'ln -s {} {}'.format(src, dst)
  if os.path.exists(dst):
    print('exist')
    return
  print(command)
  #if option == 'dry':

#_______________________________________________________________________________
if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('--dry', '-d',   action='store_true', help='dry run')
  parser.add_argument('--exec', '-e',  action='store_true', help='execute')
  parser.add_argument('--new', '-n',   action='store_true', help='execute only for new')
  parser.add_argument('--force', '-f', action='store_true', help='force execute')
  parsed, unparsed = parser.parse_known_args()
  make_link()

# #_______________________________________________________________________________
# function makelink()
# {
#     src=$1
#     dst=$2

#     case $option in
# 	dry)
# 	    echo ln -s $src $dst
# 	    ;;
# 	exe)
# 	    real1=$($readlink -f $src)
# 	    real2=$($readlink -f $dst)
# 	    if [ $real1 = $real2 ]; then
# 		echo $dst is already linking
# 	    else
# 		ls -l $src
# 		ln -isv $src $dst
# 	    fi
# 	    ;;
# 	new)
# 	    [ -e $dst -o -L $dst ] || ln -sv $src $dst
# 	    ;;
# 	force)
# 	    ln -fsv $src $dst
# 	    ;;
#     esac
# }

# #_______________________________________________________________________________
# #  Start Making
# #_______________________________________________________________________________
# echo
# echo 'command = $this  option = $option'
# echo

# file=(
#     `find $conf_dir/bash -type f`
#     `find $conf_dir/emacs -type f`
#     `find $conf_dir/mew -type f`
#     `find $conf_dir/root -type f`
#     `find $conf_dir/tmux -type f`
#     `find $conf_dir/top -type f`
#     `find $conf_dir/zsh -type f`
# )
# for f in ${file[@]}
# do
#     if [ $(basename $f) == 'Makefile' ]; then
#        continue
#     fi
#     link=$HOME/.$(basename $f)
#     makelink $f $link
# done

# makelink $conf_dir/emacs.d $HOME/.emacs.d

# echo
# echo done
# echo
