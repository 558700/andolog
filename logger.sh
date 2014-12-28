  #!/bin/bash

  log='~/.log/log.md'
  temp='~/./log/templog.md'

  header="# ~log"

  # Open up vim and write output to a temp file
  vim $temp

  # Once vim is closed, check if the temp file exists
  if [-f $temp ]; then
      # Assign the temp data to a variable and delete the file
      newlog=$(cat $temp)
      rm $temp

      # Put all the lines of the existing log into a variable, except
      # for the header line.
      logdata=$(grep -v "^$header" $log)

      # Write the header, new timestamp, new log, and old log data.
      echo -e "$header\n" > $log
      echo -e "**$(date --rfc-3339=seconds)**\n" >> $log
      echo -e "$newlog\n" >> $log
      echo -e "$logdata" >> $log

      echo "don't forget to publish!"
  else
      echo "no data"
  fi

