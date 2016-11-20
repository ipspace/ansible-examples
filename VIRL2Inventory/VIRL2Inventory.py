#!/usr/bin/env python

try:
  import sys
  import getopt
  import pprint
  from lxml import etree
except ImportError as e:
  print "Import error:",e
  sys.exit(2)

def usage():
  print "Usage: VIRL2Inventory -i file [-jva]"
  print ""
  print " -i: specify input file (default: topology.virl)"
  print " -j: output JSON"
  print " -a: use ansible_host instead of ip variable"
  print " -v: verbose"

def extractSingleNode(node):
  name = node.get("name")
  ip   = node.get("ipv4")
  os   = node.get("subtype")

  if os == "IOSv": os = "ios"

  ns  = { 'virl' : 'http://www.cisco.com/VIRL' }
  extlist = node.findall("virl:extensions/virl:entry",ns)
  for ext in extlist:
    if ext.get("key") == "static_ip": ip = ext.findtext(".",ns)

  return { 'name': name, 'ip': ip, 'os': os }

def extractNodes(doc):
  ns  = { 'virl' : 'http://www.cisco.com/VIRL' }
  nodes = doc.findall('//virl:node',ns)

  nodeList = []
  for node in nodes:
    nodeData = extractSingleNode(node)
    nodeList.append(nodeData)

  return nodeList

def readXMLFile(f):
  try:
    return etree.parse(f)
  except IOError as e:
    print e
  except etree.XMLSyntaxError as e:
    print "XML syntax error: {0}".format(e)
  except:
    print "Unexpected error:", sys.exc_info()[0]
  sys.exit(2)

def printInventory(nodeList,osVar):
  for node in nodeList:
    if 'ip' in node and node['ip']: 
      print "{name:<10} {osvar}={ip:<18} os={os}".format(osvar=osVar,**node)

def getOptions():
  try:
    options, args = getopt.getopt(sys.argv[1:], "i:jvha", ["input=", "json"])
  except getopt.GetoptError as err:
    # print help information and exit:
    print str(err)  # will print something like "option -a not recognized"
    usage()
    sys.exit(2)

  opts = { 'file': 'topology.virl', 'osvar': 'ip' }

  for opt,arg in options:
    if opt in ("-i","-input"):
      opts['file'] = arg
    elif opt in ("-j","-json"):
      opts['json'] = True
    elif opt == "-v":
      opts['verbose'] = True
    elif opt == "-a":
      opts['osvar'] = "ansible_host"
    elif opt == "-h": 
      usage()
      sys.exit(0)
    else:
      assert False,format("Unhandled option {0}",opt)

  return opts

def main():
  opts = getOptions()
  assert not 'json' in opts,"JSON printout not implemented yet"

  if 'verbose' in opts: print "Reading: "+opts['file']

  doc = readXMLFile(opts['file'])
  nodeList = extractNodes(doc)
  printInventory(nodeList,opts['osvar'])

main()