#!/usr/bin/env python

import ConfigParser
import json
import os
from texttable import Texttable
import subprocess
import sys


def main():
  files = list()
  configs = list()
  defaults = list()
  filenames = sys.argv[1:]

  # Read config
  for filename in filenames:
    if os.path.isfile(filename) is False:
      print('The file %s does not exist.' % filename)
      return 1
    config = ConfigParser.ConfigParser()
    config.read(filename)
    default = dict(config.defaults())

    files.append(filename)
    configs.append(config)
    defaults.append(default)

  # Gather sections
  sections = set()
  for config in configs:
    sections.update(config.sections())

  sections = sorted(sections)

  # Create table
  rows, columns = subprocess.check_output(['stty', 'size']).split()
  t = Texttable(max_width=int(columns))
  t.header(['Name'] + files)

  # Handling default section
  section = 'DEFAULT'
  t.add_row(['['+section+']'] + [''] * len(files))
  options = set()
  for config in configs:
    options.update(config.defaults().keys())

  options = sorted(options)
  for option in options:
    values = [option]
    for config in configs:
      if config.has_option(section, option):
        value = config.get(section, option)
        values.append(value)
      else:
        values.append('')
    t.add_row(values)
  t.add_row([''] + [''] * len(files))


  for section in sections:
    t.add_row(['['+section+']'] + [''] * len(files))
    options = set()
    for config in configs:
      if config.has_section(section) is False:
        continue
      options.update(config.options(section))

    options = sorted(options)
    for option in options:
      values = [option]
      for config, default in zip(configs, defaults):
        if config.has_option(section, option):
          value = config.get(section, option)
          if option in default and default[option] == value:
            values.append('')
            continue
          values.append(value)
        else:
          values.append('')
      if values[1:] == [''] * (len(values) - 1):
        continue
      t.add_row(values)
    t.add_row([''] + [''] * len(files))

  print t.draw()
  return 0


if __name__ == '__main__':
  sys.exit(main())
