#!/bin/bash

sum() {
    local total=0
    for num in "$@"; do
        [[ "$num" =~ ^[0-9]+ ]] || { echo 0; return; }
        total=$(bc <<< "$total + $num" 2>/dev/null)
    done
    echo "$total"
}

read -r -a line1
read -r -a line2

sum1=$(sum "${line1[@]}")
sum2=$(sum "${line2[@]}")

[[ "$sum1" == "$sum2" ]] && echo "Equal" || echo "Not equal"