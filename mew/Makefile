#!/usr/bin/make

# Author:Shuhei Hayakawa

#_______________________________________________________________________________
color	:= 1
elisp	:= $(wildcard *.el)
target	:= $(elisp:%.el=%.elc)

include ../common.mk

#_______________________________________________________________________________
.PHONY: all clean

all: $(target)

.el.elc:
	@ echo "$(green)=== Compiling $@$(default_color)"
	emacs -batch -f batch-byte-compile $<

clean:
	@ echo "$(green)=== Cleaning ...$(default_color)"
	@ rm -fv $(target)
