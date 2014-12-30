tags=[ '#tag1', '#amet']

entry = 'Lorem ipsum dolor tag #amet #tag1'


for tag in tags:
	print tag
	word_tag = tag[1:]
	print "word tag is " + word_tag
	html_tag = '<a id=\'' + word_tag + '\'>' + tag + '</a>'
	print "html tag is " + html_tag
	entry = entry.replace(tag, html_tag)

print "printing replaced entry variable"
print entry

