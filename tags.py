# takes temp_file input
entry = 'Lorem ipsum dolor tag' # this will be a variable in future
input_tags = raw_input("> any tags? >") # prompt on cli for tags

input_tags = str(input_tags) # stringifyes input
tags = input_tags.split() # lists inputs

for tag in tags: # for each tag entered: 
	html_tag = '<a class=\'' + tag + '\'>' + '#' +  tag + '</a>' # htmlifies tag
	entry = entry + " " + html_tag # appends to entry

# needs to return to seperate tagged file: /var/www/log/tags/

print "printing replaced entry variable" # debug text
print entry #returns entry

