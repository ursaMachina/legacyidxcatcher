#!/bin/sh

#set the location of the list of index names, a file with an index name per new line.
LIST_FILE="./legidxfile"

#set the location of the outputfile/name.
TSFMS="./transforms.conf"
PROPS="./props.conf"
RE1="(\w+),"
  echo "Starting."
  echo "#created by script" >>$TSFMS
  echo "" >>$TSFMS
  echo "#created by script" >>$PROPS
  echo "" >>$PROPS
  IFS=$'\n'
  for DST in `cat "$LIST_FILE"`; do
    if [ -z "$DST" ]; then
      continue;
    fi
    var=$(echo $DST|awk '{print $1}')
    var2=$(echo $DST|awk '{print $2}')

    echo "[$var""_legtsfm]" >> $TSFMS
    echo "SOURCE_KEY = _MetaData:Index" >> $TSFMS
    echo "REGEX = $var" >> $TSFMS
    echo "DEST_KEY = _MetaData:Index" >> $TSFMS
    echo "FORMAT = $var2" >> $TSFMS
    echo "" >> $TSFMS
    echo "$var""_legtsfm," >> $PROPS
   done  
  echo "Finished"
