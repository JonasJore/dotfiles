#!/usr/bin/python
import os
import re
import time
import pathlib

def delete_files(files):
  global NUM_DUPES
  for item in files:
    if "Copy" in item or "copy" in item or re.search(MATCHING_PARENS_REGEX, item) is not None:
      os.remove("./" + item)
      NUM_DUPES += 1

def get_files_under(dirs):
  for dir in dirs:
    crawl = os.walk(dir)
    files_under_dir = []
    for root, dir_names, file_names in crawl:
      root = pathlib.Path(root)
      if dir_names:
        for dir in dir_names:
          get_files_under(dir)
      for file_name in file_names:
        files_under_dir.append(str(root) + "/" + file_name)
    delete_files(files_under_dir)
    
startTime = time.time()
files = []
dirs = []
MATCHING_PARENS_REGEX = r'[\(\)]'
NUM_DUPES = 0

for (_, dirnames, filenames) in os.walk("./"):
  files.extend(filenames)
  dirs.extend(dirnames)
  break

if not dirs:
  delete_files(files)
else: 
  delete_files(files)
  get_files_under(dirs)
print("------------------------------------------")
print("job ran for: %s seconds"  % (time.time() - startTime))
print("removed %s dupes" % str(NUM_DUPES))
print("------------------------------------------")