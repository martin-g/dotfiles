#!/bin/sh

FOLDER=$1
FILENAME=$2

if [ "x" = "x$FOLDER" ]; then
	echo "Usage: jarscan.sh folder classFile"
	exit 1
fi

if [ "x" = "x$FILENAME" ]; then
	echo "Usage: jarscan.sh folder classFile"
	exit 2
fi

$JAVA_HOME/bin/java -jar ~/bin/jarscan.jar -dir $FOLDER -class $FILENAME
