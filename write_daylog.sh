# daylog opener
# run this at startup to have notes ready

FILE=~/Notes/content/log/$(date +%Y)-$(date +%m)_DAYLOG.md
MONTH=$(date '+%Y-%m')
DATE=$(date '+%a %Y-%m-%d %l:%M %P')

echo "$FILE"

if test -f "$FILE"; then
    echo "$FILE exists."
    sed -i "6i $DATE" $FILE
    sed -i '7i --------------------------------------------------------------------------------\n\n\n' $FILE
    code -g $FILE:9
  else
    echo "$FILE does not exist"
    echo "---" >> $FILE
    echo "title: daylog" $(date +%Y)-$(date +%m) >> $FILE
    echo "date: " $(date +%Y)-$(date +%m) >> $FILE
    echo "---" >> $FILE
    echo >> $FILE
    echo >> $FILE
    echo "$DATE" >> $FILE
    echo "--------------------------------------------------------------------------------" >> $FILE
    echo >> $FILE 
    code -g $FILE:10
fi
