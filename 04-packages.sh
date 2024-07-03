#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME= echo( $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME$TIMESTAMP.log

R= \e[31m
G= \e[32m
Y= \e[33m
c= \e[36m

if [ $USERID -ne 0 ]
then
  echo -e "$R you must rin the code as a super user"
  exit 1
else
  echo "you are a super user"
fi

for i in $@
do
    echo "package to install: $i"
    dnf list installed $i &>>LOGFILE
    if[$? -eq o]
    then
      echo " $i is already installed"
    else
      echo -e "$c $i not installed"
      dnf install $i
    fi
done

