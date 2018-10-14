#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import readline
import atexit

try:
  histfile = os.path.join(os.environ["HOME"], ".python_history")
  open(histfile, 'a').close()
  readline.read_history_file(histfile)
  atexit.register(readline.write_history_file, histfile)
except IOError:
  pass
