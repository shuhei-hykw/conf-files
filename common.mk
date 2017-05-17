#!/usr/bin/make

# Author: Shuhei Hayakawa

#_______________________________________________________________________________
# shell command ________________________________________________________________
QUIET	:= @
ifeq ($(shell uname -s),Darwin)
ECHO	:= gecho -e
else
ECHO	:= echo -e
endif
CP	:= cp -fv
RM	:= rm -fv
MV	:= mv -fv

#_______________________________________________________________________________
# escape sequence ______________________________________________________________
ifeq ($(color),1)
black           = \033[0;30;1m
red             = \033[0;31;1m
green           = \033[0;32;1m
yellow          = \033[0;33;1m
blue            = \033[0;34;1m
magenta         = \033[0;35;1m
cyan            = \033[0;36;1m
white           = \033[0;37;1m
default_color   = \033[0m
endif
