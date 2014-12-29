  #!/bin/bash
  current_dir=$(pwd)
  entries_dir=$current_dir'/entries'
  temp_file=$entries_dir'/templog.md'
  log_file=$entries_dir'/log.md'
  header="# ~log"

  # Open up vim and write output to a temp file
  nano $temp_file

  # Once vim is closed, check if the temp file exists
  if [ -f $temp_file ]; then
      # Assign the temp data to a variable and delete the file
      newlog=$(cat $temp_file)
      rm $temp_file

      # Put all the lines of the existing log into a variable, except
      # for the header line.
      logdata=$(grep -v "^$header" $log_file)

      # Write the header, new timestamp, new log, and old log data.
      echo -e "$header\n" > $log_file
      echo -e "**$(date --rfc-3339=seconds)**\n" >> $log_file
      echo -e "$newlog\n" >> $log_file
      echo -e "$logdata" >> $log_file
      echo "logged and..."
      echo $(bash publisher.sh)
  else
      echo "not logged, without data"
  fi

