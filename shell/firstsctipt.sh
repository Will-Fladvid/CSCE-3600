#!/bin/bash

childrate=3
adultrate=10
seniorrate=7

read -p "Enter your age: " age

case $age in 
	([1-9|[1][0-2]) 
		echo "price is" '$'"$childrate.00";;
	([1][3-9]|[2-5][0-9])
		echo "price is" '$'"$adultrate.00";;
	([6-9][0-9])
		echo "price is" '$'"$seniorrate.00";;
esac

