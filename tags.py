# takes temp_file input
f = open ('./entries/templog.md', 'r')
entry = f.read()
f.close()

input_tags = raw_input("> any tags? >") # prompt on cli for tags

input_tags = str(input_tags) # stringifyes input
tags = input_tags.split() # lists inputs

for tag in tags: # for each tag entered: 
	html_tag = '<a class=\'' + tag + '\'>' + '#' +  tag + '</a>' # htmlifies tag
	entry = entry + "\n" + html_tag # appends to entry

# needs to return to seperate tagged file: /var/www/log/tags/

#writes entry variable to file
f = open ('./entries/templog.md', 'w')
f.write(entry)
f.close
