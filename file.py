#Added for git test

#!/usr/bin/env python


import re

counter = 0 
print ('counter;timeStamp;username;timestamp1')

import os
import fnmatch

currentDir = os.getcwd()

for dirpath, dirs, files in os.walk(currentDir):
   for filename in fnmatch.filter(files, '*.txt'):
        with open(os.path.join(dirpath, filename)) as f:
            for line in f:
                timeStamp = re.search("[[A-Za-z0-9_+_:_/_ ]*]", line)
                username = re.search("username=[^&]+", line)
                timeStamp1 = re.search("&timestamp=[^&]+", line)
                if timeStamp and username:
                    counter += 1
                    print (str(counter))