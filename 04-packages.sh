#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
C="\[36m"

if [ $USERID -ne 0 ]
then
  echo -e "$R you must rin the code as a super user"
  exit 1
else
  echo -e "$Y you are a super user"
fi

for i in $@
do
    echo "package to install: $i"
    dnf list installed $i &>>LOGFILE
    if [ $? -ne 0 ]
       then
      echo -e " $R **** $Y $i is already installed $R******"
    else
      echo -e "$R ********* $C $i not installed $R ******"
      dnf install $i
    fi
done
