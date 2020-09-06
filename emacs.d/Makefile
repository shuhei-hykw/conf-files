#!/usr/bin/make

# Author: Shuhei Hayakawa

#_______________________________________________________________________________
color	:= 1
elisp	:= $(wildcard *.el) $(wildcard site-lisp/*.el)
target	:= $(elisp:%.el=%.elc)

include ../common.mk

#_______________________________________________________________________________
.PHONY: all package clean

all: $(target)

.el.elc:
	$(QUIET) $(ECHO) "$(green)=== Compiling $@$(default_color)"
	emacs -l init.el -batch -f batch-byte-compile $<

package:
	$(QUIET) $(ECHO) "$(green)=== Install packages $@$(default_color)"
	emacs -q --script install-use-package.el

clean:
	$(QUIET) $(ECHO) "$(green)=== Cleaning ...$(default_color)"
	$(QUIET) $(RM) $(target)
