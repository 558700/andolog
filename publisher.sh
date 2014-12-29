#!/bin/bash

# configure the commented variables below

html_dir='/var/www/' # directory to which log.html should be output
ando_dir='/home/ive/andolog' # path to andolog file (run $pwd in file)
entry_dir=$ando_dir'/entries'
template_dir=$ando_dir'/entries/templates'
cd $entry_dir

  for file in *.md; do
      html=$(echo $file | sed 's/\(.*\.\)md/\1html/')
      cat $template_dir/header.html > $html_dir/$html
      markdown $file >> $html_dir/$html
      cat $template_dir/footer.html >> $html_dir/$html
      printf "published $html // " # ( publish message )
      done
echo "どうもありがとう ～アンド" # (many thanks, ~ando)
