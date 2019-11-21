#!/bin/sh

#set -e

#______________________________________________________________________________
cmd=$(basename $0)
brew=brew
time_stamp=$(date +%Y%m%d)
#log_dir=/tmp
#log_dir=$HOME/tmp
log_dir=$HOME
#log_file=$log_dir/brew_update.$time_stamp
log_file=$log_dir/brew_update.log

#______________________________________________________________________________
function dobrew()
{
    echo | tee -a $log_file
    echo \$ $brew $1 $2 | tee -a $log_file
    $brew $1 $2 2>&1 | tee -a $log_file
}

date | tee $log_file
dobrew update
dobrew upgrade
dobrew cleanup
dobrew list --versions
dobrew doctor
