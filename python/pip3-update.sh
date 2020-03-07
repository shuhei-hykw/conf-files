#!/bin/sh

pip3 list -o | \
    awk '{if ($1 != "Package" && $1 !~ /^-+$/) print $1}' | \
    xargs pip3 install -U pip
