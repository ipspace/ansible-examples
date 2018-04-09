#
# Simple list append filter
#
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from jinja2 import TemplateError
import re

def clean_config(l,*argv):
  for element in argv:
    if type(element) is list:
      for value in element:
        l = clean_config(l,value)
    else:
      regex = re.sub('\.\.\.','.*?\\n',element)
      l = re.sub(regex,'',l)
  return l


class FilterModule(object):

  def filters(self):
    return {
      'clean_config': clean_config
    }