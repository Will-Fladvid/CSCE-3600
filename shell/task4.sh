#1/bin/bash

read -p "Enter a number" num

for ((i=1 ; i<=$num ; i=$i+1))
do
	let "sum = $sum + $i"
done
echo "Sum of numbers is: $sum"
