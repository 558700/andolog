  #!/bin/bash

  # configure the commented lines below. (brackets optional)
  ando_dir='/home/ive/andolog' # path to andolog file (run $pwd to find this)
  tags_file=$ando_dir'/tags.py'
  entries_dir=$ando_dir'/entries'
  temp_file=$entries_dir'/templog.md'
  log_file=$entries_dir'/index.md'
  header="# ~log" # (the header at the top of the log)

  nano $temp_file
  if [ -f $temp_file ]; then
      python $tags_file
      newlog=$(cat $temp_file)
      rm $temp_file
      logdata=$(grep -v "^$header" $log_file)
      echo -e "$header\n" > $log_file
      echo -e "**$(date --rfc-3339=seconds)**\n" >> $log_file # (adds date)
      echo -e "$newlog\n" >> $log_file
      echo -e "$logdata" >> $log_file
      echo "logged and..." # (log confirmation dialogue)
      echo $(bash $ando_dir/publisher.sh)
  else
      echo "not logged, without data" # (log failure dialogue)
  fi

