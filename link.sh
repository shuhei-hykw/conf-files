#!/bin/sh

# Author: Shuhei Hayakawa

#_______________________________________________________________________________
this=$(basename $0)
function usage()
{
    echo
    echo "Usage: $this [options]"
    echo
    echo "  -d, --dry       dry run"
    echo "  -e, --exec      execute"
    echo "  -n, --new       execute only for new"
    echo "  -f, --force     force execute"
    echo
}

#_______________________________________________________________________________
if [ $# = 0 ]; then
    usage
    exit 0
fi
option=
if [ $1 = "-d" -o $1 = "--dry" ]; then
    option=dry
elif [ $1 = "-e" -o $1 = "--exec" ]; then
    option=exec
elif [ $1 = "-n" -o $1 = "--new" ]; then
    option=new
elif [ $1 = "-f" -o $1 = "--force" ]; then
    option=force
else
    usage
    exit 1
fi

#_______________________________________________________________________________
readlink=readlink
case $OSTYPE in
    darwin*)
	readlink=greadlink;;
    *);;
esac
conf_dir=$(dirname $($readlink -f $0))

#_______________________________________________________________________________
function makelink()
{
    src=$1
    dst=$2

    if [ $option = "dry" ]; then
	echo ln -s $src $dst
    elif [ $option = "exec" ]; then
	real1=$($readlink -f $src)
	real2=$($readlink -f $dst)
	if [ $real1 = $real2 ]; then
	    echo $dst is already linking
	else
	    ls -l $src
	    ln -isv $src $dst
	fi
    elif [ $option = "new" ]; then
	[ -e $dst -o -L $dst ] || ln -sv $src $dst
    elif [ $option = "force" ]; then
	ln -fsv $src $dst
    fi
}

#_______________________________________________________________________________
#  Start Making
#_______________________________________________________________________________
echo
echo "command = $this  option = $option"
echo

file=(
    `find $conf_dir/bash -type f`
    `find $conf_dir/emacs -type f`
    `find $conf_dir/mew -type f`
    `find $conf_dir/root -type f`
    `find $conf_dir/tmux -type f`
    `find $conf_dir/top -type f`
    `find $conf_dir/zsh -type f`
)
for f in ${file[@]}
do
    link=$HOME/.$(basename $f)
    makelink $f $link
done

#_______________________________________________________________________________
file=(
    `find $conf_dir/emacs.d -type f -name "*.el*"`
)
for f in ${file[@]}
do
    link=$HOME/.emacs.d/$(basename $f)
    makelink $f $link
done

echo
echo done
echo