#!/bin/bash

read -p "Problem Number: " PROBLEM_NO
read -p "Problem Rating: " RATING
read -p "Problem Name: " PROBLEM_NAME

DATE=$(date +%Y%m%d) # get date in YYYYMMDD format

DIR_NAME="${DATE} ${PROBLEM_NO} r${RATING} - ${PROBLEM_NAME}"

BASE_PATH="/home/void/git/cp/codeforces/problemsets"
FULL_PATH="${BASE_PATH}/${DIR_NAME}"

mkdir -p "$FULL_PATH" || { echo "Failed to create directory"; exit 1; }

# copy sol.cpp template
cp /home/void/git/cp/sol.cpp "$FULL_PATH/" || { echo "Failed to copy sol.cpp"; exit 1; }

touch "$FULL_PATH/problem.txt"

subl4 "$FULL_PATH/problem.txt" "$FULL_PATH/sol.cpp"
sleep 0.3
swaymsg --quiet layout toggle split 
sleep 0.3
swaymsg --quiet resize grow width 500px


echo "$FULL_PATH"
