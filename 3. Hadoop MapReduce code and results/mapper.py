#!/usr/bin/python

import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
    line = line.strip()
    line = line.split(",")

	name = line[0]
	rating = line [1]
	
	print '%s\t%s' % (name, rating)