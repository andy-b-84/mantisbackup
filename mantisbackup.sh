#!/bin/bash

# Will dump the mantisbt database in a local file in /tmp,
# then put it in the /home folder of a FTP user on its server,
# then delete the local file.
#
# You have to provide correct values below to make this script do anyhting.
# Please feel free to change any value which does not reflect your configuration.
# 
# Two ways to call it :
#    chmod 755 mantisbackup.sh;# or chmod u+x, but I hate that syntax
#    then type ./mantisbackup.sh
# or just type :
#    /bin/bash ./mantisbackup.sh

# File variables
DATETIME=`which date`' +%Y%m%d.%H%M%S'
CURRENTDATETIME=`$DATETIME`
FILENAME='mantisbt.'$CURRENTDATETIME'.sql'
LOCALFILEPATH='/tmp/'$FILENAME

# MySQL variables
MYSQLDUMP=`which mysqldump`
MYSQLHOST='localhost'
MYSQLUSER='root'
MYSQLPASS='PUT_YOUR_MYSQL_PASSWORD_HERE'
MYSQLDB='mantisbt'

# FTP variables
FTP=`which ftp`
FTPHOST='PUT_YOUR_FTP_HOST_HERE'
FTPUSER='PUT_YOUR_FTP_USER_HERE'
FTPPASS='PUT_YOUR_FTP_PASSWORD_HERE'
DISTANTFILEPATH='~/'$FILENAME

# Basic System Programs
ECHO=`which echo`
RM=`which rm`

# Dumps MySQL Database into /tmp
$MYSQLDUMP -h $MYSQLHOST -u $MYSQLUSER --password=$MYSQLPASS -d $MYSQLDB > $LOCALFILEPATH

# Sends the file using FTP
$ECHO -e "open $FTPHOST\nuser $FTPUSER $FTPPASS\nput $LOCALFILEPATH $DISTANTFILEPATH\nbye" | $FTP -n

# Deletes the local file
$RM $LOCALFILEPATH
