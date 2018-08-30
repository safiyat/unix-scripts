#!/usr/bin/env python

import ConfigParser
import json
import os
from prettytable import PrettyTable
import sys


def main():
  files = list()
  configs = list()
  filenames = sys.argv[1:]

  # Read config
  for filename in filenames:
    if os.path.isfile(filename) is False:
      print('The file %s does not exist.' % filename)
      return 1
    config = ConfigParser.ConfigParser()
    config.read(filename)

    files.append(filename)
    configs.append(config)

  # Gather sections
  sections = set()
  for config in configs:
    sections.update(config.sections())

  sections = sorted(sections)

  # Create table
  t = PrettyTable(['Name'] + files)

  for section in sections:
    t.add_row(['['+section+']'] + ['========'] * len(files))
    options = set()
    for config in configs:
      if config.has_section(section) is False:
        continue
      options.update(config.options(section))

    options = sorted(options)
    for option in options:
      values = [option]
      for config in configs:
        if config.has_option(section, option):
          values.append(config.get(section, option))
        else:
          values.append('')
      t.add_row(values)
    t.add_row(['========'] + ['========'] * len(files))

  print t.get_string(left_padding_width=1)
  return 0


if __name__ == '__main__':
  sys.exit(main())
