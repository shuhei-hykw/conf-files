#!/bin/sh

# Author: Shuhei Hayakawa

#_______________________________________________________________________________
readlink=readlink
case $OSTYPE in
    darwin*)
	readlink=greadlink;;
    *);;
esac

#_______________________________________________________________________________
this=$(basename $0)
conf_dir=$(dirname $($readlink -f $0))

file=(`find $conf_dir -type f`)

for f in ${file[@]}
do
    if echo $f | grep git >/dev/null; then continue; fi
    if echo $f | grep $this >/dev/null; then continue; fi
    link=$HOME/.$(basename $f)
    if [ -f $link ]; then
	ls -l $link
	read -p "$link already exists Overwrite? [y/N] " r
	case $r in
	    [yY]|[yY]es|YES)
		ln -fsv $f $link
		;;
	    *)
		echo "nothing changes"
		;;
	esac
    fi
done
