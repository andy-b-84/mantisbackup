#!/bin/bash

# File variables
DATETIME=`which date`' +%Y%m%d.%H%M%S'
CURRENTDATETIME=`$DATETIME`
FILENAME='mantisbt.'$CURRENTDATETIME'.sql'
LOCALFILEPATH='/tmp/'$FILENAME

# MySQL variables
MYSQLDUMP=`which mysqldump`
MYSQLHOST='localhost'
MYSQLUSER='root'
MYSQLPASS='XXXX'
MYSQLDB='mantisbt'

# FTP variables
FTP=`which ftp`
FTPHOST='XXX.XXX.XXX.XXX'
FTPUSER='XXXX'
FTPPASS='XXXX'
DISTANTFILEPATH='~/'$FILENAME

ECHO=`which echo`

# Dumps MySQL Database into /tmp
$MYSQLDUMP -h $MYSQLHOST -u $MYSQLUSER --password=$MYSQLPASS -d $MYSQLDB > $LOCALFILEPATH

# Sends the file using FTP
$ECHO -e "open $FTPHOST\nuser $FTPUSER $FTPPASS\nput $LOCALFILEPATH $DISTANTFILEPATH\nbye" | $FTP -n
