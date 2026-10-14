#!/bin/bash

curve() {
    incr=$1
    shift
    arr=("$@")
    index=0
    for i in "${arr[@]}"; do
	    let grades[$index]=$((i + incr))
        ((index++))
done
    echo "${grades[@]}"
}

if [ $# -ne 1 ]; then
    echo "Usage: $0 <curve_amount>"
    exit 1
fi

declare -a grades
for i in 1 2 3 4 5; do
    echo -n "Enter grade for quiz $i: "
    read grades[$((i-1))]
done

curve "$@" "${grades[@]}"


echo "Curved Grades:"


for ((i = 0; i < ${#grades[@]}; i++)); do
    echo "Quiz $((i+1)): ${grades[$i]}"
done

#WJF0053 William Fladvid
