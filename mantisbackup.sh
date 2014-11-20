#!/bin/bash

# File variables
TIMESTAMP=`which date`' +%s'
CURRENTTIMESTAMP=`$TIMESTAMP`
FILENAME='/tmp/mantisbt.'$CURRENTTIMESTAMP'.sql'

# MySQL variables
MYSQLDUMP=`which mysqldump`
MYSQLHOST='localhost'
MYSQLUSER='root'
MYSQLPASS='XXXX'
MYSQLDB='mantisbt'

# Dumps MySQL Database into /tmp
$MYSQLDUMP -h $MYSQLHOST -u $MYSQLUSER --password=$MYSQLPASS -d $MYSQLDB > $FILENAME
