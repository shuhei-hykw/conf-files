#!/bin/sh

# Author: Shuhei Hayakawa

#_______________________________________________________________________________
readlink=readlink
case $OSTYPE in
    darwin*)
	readlink=greadlink;;
    *);;
esac

this=$(basename $0)
conf_dir=$(dirname $($readlink -f $0))

#_______________________________________________________________________________
file=(
    `find $conf_dir/bash -type f`
    `find $conf_dir/root -type f`
    `find $conf_dir/tmux -type f`
    `find $conf_dir/zsh -type f`
)

for f in ${file[@]}
do
    link=$HOME/.$(basename $f)
    if [ -f $link ]; then
	ls -l $link
    fi
    ln -isv $f $link
done

#_______________________________________________________________________________
file=(
    `find $conf_dir/emacs -type f -name "*.el*"`
)

for f in ${file[@]}
do
    link=$HOME/.emacs.d/$(basename $f)
    if [ -f $link ]; then
	ls -l $link
    fi
    ln -isv $f $link
done
