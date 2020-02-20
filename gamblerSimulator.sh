#!/bin/bash -x

echo Welcome
#constants
STAKE_PER_DAY=100
BET_EACH_CHANCE=1
IS_WIN=1
total_cash_After_Month=0
days=20
#variables
cash=STAKE_PER_DAY
MAXIMUM_WIN=$(($STAKE_PER_DAY + $STAKE_PER_DAY/2))
MAXIMUM_LOOSE=$(($STAKE_PER_DAY/2))

declare -A cashCount
#storing the  days count
for ((  count=1; count<=days; count++))
do
	cash=STAKE_PER_DAY
	echo "$count=${cashCount[$count]}"
	while (( $cash != $MAXIMUM_WIN && $cash != $MAXIMUM_LOOSE ))
	do
#checking the random win or loose
		winCheck=$(( RANDOM%2 ))
		if (( $IS_WIN == $winCheck ))
		then
			echo "$MAXIMUM_WIN:win"
			((cash++))
		else
			echo "$MAXIMUM_LOOSE:loose"
			((cash--))
		fi
	done
	cash=$(($STAKE_PER_DAY-$cash))
	echo $cash
#storing the daily winning and loosing cost in dictionary
	cashCount[$count]=$cash
	total_cash_After_Month=$(($(($total_cash_After_Month))+$(($cash))))
done
echo "total cash of 20 days: $total_cash_After_Month"
echo ${cashCount[@]}
echo ${#cashCount[@]}





