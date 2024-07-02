#installation
#---------------
#if you want to install you should have super user access
#so check user
#if super user, proceed
#if not super user, I should throw proper error
#
#How you run a command inside shell script and take the output
#
#if id is 0 then super user, if not 0 then normal user
#
#if error comes, can we proceed? NO

USERID=$(id -u)

if [ USERID -ne 0 ]
then
   echo "Please run this script with root access."
else
   echo "you are super user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql...FAILURE"
    exit 1
else
    echo "Installation of mysql...SUCCESS"
fi


dnf install nginx -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql...FAILURE"
    exit 1
else
    echo "Installation of mysql...SUCCESS"
fi

echo "is script proceeding?"