#!/bin/bash

html_dir='/var/www/'
current_dir=$(pwd)
entry_dir=$current_dir'/entries'
template_dir=$current_dir'/entries/templates'
cd $entry_dir

  # For each of the files with the extension .md in the directory
  for file in *.md; do
      # store the filename and replace .md with .html
      html=$(echo $file | sed 's/\(.*\.\)md/\1html/')
      # Insert the contents of the header.html template into the
      # html file
      cat $template_dir/header.html > $html_dir/$html
      # The markdown command converts markdown to html. The output
      # is appended to the html file.
      markdown $file >> $html_dir/$html
      # Read the contents of the footer and append to the html.
      cat $template_dir/footer.html >> $html_dir/$html
      printf "published $html // "
      done
echo "どうもありがとう ～アンド"