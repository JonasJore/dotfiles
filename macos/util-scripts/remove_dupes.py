#!/usr/bin/python
from os import walk, remove
from re import search
import time

startTime = time.time()
f = []
matchingParens = r'[\(\)]'
numDupes = 0

for (path, dirnames, filenames) in walk("./"):
	f.extend(filenames)
	break

for item in f:
	if "Copy" in item or "copy" in item or search(matchingParens, item) is not None:
		remove("./" + item)
		numDupes += 1
		print("Deleted " + str(numDupes) + " duplicates...")

print("job ran for: %s seconds"  % (time.time() - startTime))