#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

USERID=$(id -u)

# shellcheck disable=SC2170
if [ $USERID -ne 0 ]
then
   echo "Please run this script with root access."
else
   echo "you are super user"
fi


VALIDATE(){
if [ $1 -ne 0 ]
then
    echo "Installation of mysql...FAILURE"
    exit 1
else
    echo "Installation of mysql...SUCCESS"
fi

}

dnf install mongodb -y $>>LOGFILE
VALIDATE $? "Installing mongodb"
dnf install nodejs -y $>>LOGFILE
VALIDATE $? "Installing nodejs"



##!/bin/bash
#
#USERID=$(id -u)
#TIMESTAMP=$(date +%F-%H-%M-%S)
#SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
#LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
#
#VALIDATE(){
#   if [ $1 -ne 0 ]
#   then
#        echo "$2...FAILURE"
#        exit 1
#    else
#        echo "$2...SUCCESS"
#    fi
#}
#
#if [ $USERID -ne 0 ]
#then
#    echo "Please run this script with root access."
#    exit 1 # manually exit if error comes.
#else
#    echo "You are super user."
#fi
#
#dnf install mysql -y &>>$LOGFILE
#VALIDATE $? "Installing MySQL"
#
#dnf install git -y &>>$LOGFILE
#VALIDATE $? "Installing Git"