tags=[ '#tag1' ]

entry = 'Lorem ipsum dolor tag #amet #tag1'


for item in tags:
	print item
	entry = entry.replace(item, '<a id=\'tag1\'>#tag1</a>')

print "printing replaced entry variable"
print entry

