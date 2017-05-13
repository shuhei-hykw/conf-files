#!/usr/bin/make

# Author:Shuhei Hayakawa

#_______________________________________________________________________________
elisp	:= $(wildcard *.el)
target	:= $(elisp:%.el=%.elc)

#_______________________________________________________________________________
.PHONY: all clean

all: $(target)

.el.elc:
	@ echo "Compiling $@"
	emacs -batch -f batch-byte-compile $<

clean:
	@ echo "Cleaning ..."
	@ rm -fv $(target)
