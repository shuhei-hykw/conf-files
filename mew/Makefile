#!/usr/bin/make

# Author:Shuhei Hayakawa

#______________________________________________________________________________
color	:= 1
elisp	:= $(wildcard *.el)
target	:= $(elisp:%.el=%.elc)

include ../common.mk

#______________________________________________________________________________
.PHONY: all clean

all: $(target)

.el.elc:
	$(QUIET) $(ECHO) "$(green)=== Compiling $@$(default_color)"
	emacs -batch -f batch-byte-compile $<

clean:
	$(QUIET) $(ECHO) "$(green)=== Cleaning ...$(default_color)"
	$(QUIET) $(RM) $(target)
