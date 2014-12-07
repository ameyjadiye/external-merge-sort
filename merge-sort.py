#!/usr/bin/python

import os
cache=dict()
path="./inputs/"
for file in os.listdir(path):
	file=open(path+file)
        for line in file:
               	#print line.strip()
               	striped_line=line.strip()
               	arr=striped_line.split('^')
               	url=arr[0]
               	seg=arr[1]
               	if url not in cache:
                       	cache[url]=set(seg.split(','))
               	else:
                       	cache[url].update(seg.split(','))
        file.close()

for k, v in cache.iteritems():
        print k+"^"+",".join(v)

