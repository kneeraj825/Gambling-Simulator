#!/bin/bash -x

echo Welcome
#constants
STAKE_PER_DAY=100
BET_EACH_CHANCE=1
IS_WIN=1
cash=100
winCheck=$(( RANDOM%2 ))
if (( $IS_WIN == winCheck ))
then
	echo "win"
	((cash++))
else
	echo "loose"
	((cash--))
fi
echo "$cash"
