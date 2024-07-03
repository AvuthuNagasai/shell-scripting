#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME$TIMESTAMP.log

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
    fi
}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
C="\e[36m"

if [ $USERID -ne 0 ]
then
  echo -e "$R you must run the code as a super user"
  exit 1
else
  echo -e "$Y you are a super user"
fi

for i in $@
do
    echo -e " $G package to install: $i"
    dnf list installed $i &>>LOGFILE
    if [ $? -ne 0 ]
       then
      echo -e " $R **** $Y $i is already installed $R******"
    else
      echo -e " $C ********* $i $R is not installed $C ******"
      dnf install $i -y
      VALIDATE $?
    fi
done
