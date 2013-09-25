#!/bin/bash
#THIS WILL BE THE PRE BACKUP SCRIPT, MOSTLY FOR MYSQL DUMP AND SIMILAR
#
#
##Check if Backup directory is available
echo "Check if Backup folder is present..."
if [ ! -e "/home/backup/backups" ]
then
    echo "Backup folder not present..."
    echo "creating backup folder..."
    mkdir "/home/backup/backups"
    echo "Done."
else
    echo "Backup folder is present!"
fi
#
##Create MySQL Dumps
echo " dumping databases"
for i in /var/lib/mysql/*/; do
    name=`basename $i`
    
    # get username + password
    user=$(grep user /etc/mysql/debian.cnf | awk '{print $3}' | head -n 1)
    pass=$(grep pass /etc/mysql/debian.cnf | awk '{print $3}' | head -n 1)
    
    # do the dump
    mysqldump --user="$user" --pass="$pass" $name | gzip > /var/backups/mysql/$name.gz
    done
#Insert Custom scripts here:
#

