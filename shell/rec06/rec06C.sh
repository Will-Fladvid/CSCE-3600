#!/bin/bash

num=$(((RANDOM % 10)+1))
answer=0
while [ $answer -ne $num ]
do
read -p  "Enter a number between 1 and 10: " answer

if [ $answer -ne $num ]
then echo "Sorry, you are not correct. Try again!"

else echo "Contrats, the number is $num"
fi
done

