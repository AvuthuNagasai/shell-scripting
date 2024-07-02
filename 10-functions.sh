#!/bin/bash

#echo "Hi, i am learning devops"
#
#Person1=$1
#Person2=$2
#
#echo "$Person1: hi , how are you ?"
#echo "$Person2: fine, how are you doing?"
#echo "$Person1:nice to see you!!"
#echo "$Person2:see you, bye bye!"


#!/bin/bash
#
#echo "Please enter username::"
#
#read -s USERNAME #here USERNAME is variable
#
#echo "Please enter password::"
#
#read -s PASSWORD
#
#echo "Username is: $USERNAME, Password is: $PASSWORD"



# shellcheck disable=SC1036
Fruits=("banana""apple" "orange" "grapes" "mango")

echo "my first favourite fruit is: ${Fruits[0]}"
echo "my second favourite fruit is: ${Fruits[1]}"
echo "my favourite fruits are : ${Fruits[@]}"




