#!/usr/bin/python3

import sys
import os


# Additional resolutions.
resolutions = [ '1280x720', '1920x1080' ]

count = 1

print('Select your resolution:\n\n')

for resolution in resolutions:
    print('{count}. {resolution}'.format(count=count, resolution=resolution))
    count = count + 1

selection = input('Please select your resolution: ')

try:
    val = int(selection) -1
    runcmd = 'xrandr -s {val}'.format(val = resolutions[val])
    os.system(runcmd)
except:
    print('Exiting...')