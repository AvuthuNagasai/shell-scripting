#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

USERID=$(id -u)

if [ USERID -ne 0 ]
then
   echo "Please run this script with root access."
else
   echo "you are super user"
fi


validate(){
if [ $1 -ne 0 ]
then
    echo "Installation of mysql...FAILURE"
    exit 1
else
    echo "Installation of mysql...SUCCESS"
fi

}

dnf install mysql -y $>>LOGFILE
VALIDATE $? "Installing MySQL"
dnf install nginx -y $>>LOGFILE
VALIDATE $? "Installing Nginx"

