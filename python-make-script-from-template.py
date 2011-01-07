#!/usr/bin/python


help = """
This script takes exactly one arg and writes a file to there
with my default python template.
If the file is `-' stdout is used.
"""

import sys
import os
import stat

def bye(n,s):
    print >> sys.stderr, help
    print >> sys.stderr, s
    sys.exit(n)

if 2 != len(sys.argv):
    bye(1, "Incorrect number of args.")
else:
    fn = sys.argv[1]

if os.path.exists( fn ):
    bye(2, "File exists.")

if "-" == fn:
    f = sys.stdout
    doChmod = False
else:
    f = open( fn, "w" )
    doChmod = True

print >> f, """#!/usr/bin/python

help = \"""
This text should be replaced by help text for this script.
\"""

import sys
import os
import re

def wrn( s ):
    print >> sys.stderr, help
    print >> sys.stderr, s

def bye( n, s ):
    wrn( s )
    sys.exit( n )






def main():
    print "This script does nothing."






if __name__=="__main__":
    main()
"""
f.close()
# Make it executable if wanted.
if doChmod:
    perm = os.stat( fn )
    perm = perm[ stat.ST_MODE ]
    perm = stat.S_IMODE( perm )
    perm = perm | stat.S_IXUSR
    perm = perm | stat.S_IXGRP
    perm = perm | stat.S_IXOTH
    os.chmod( fn, perm )


