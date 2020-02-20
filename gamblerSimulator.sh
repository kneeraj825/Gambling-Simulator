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
declare -A cashCount
#storing the  days count
for ((  count=1; count<=days; count++))
do
	cash=STAKE_PER_DAY
	MAXIMUM_WIN=$(($STAKE_PER_DAY + $STAKE_PER_DAY/2))
	MAXIMUM_LOOSE=$(($STAKE_PER_DAY/2))
	while (( $cash != $MAXIMUM_WIN && $cash != $MAXIMUM_LOOSE ))
	do
#checking the random win or loose
		winCheck=$(( RANDOM%2 ))
		if (( $IS_WIN == $winCheck ))
		then
			echo "won by: $MAXIMUM_WIN"
			((cash++))
		else
			echo "loose by: $MAXIMUM_LOOSE"
			((cash--))
		fi
		echo $cash
		Cash=$(($cash-$STAKE_PER_DAY))
	done
	echo $cash
#storing the daily winning and loosing cost in dictionary
	cashCount[$count]=$cash
	total_Cash_After_Month=$(($(($total_cash_After_Month))+$(($Cash))))
done
echo "total cash of 20 days: $total_Cash_After_Month"
echo "${cashCount[@]}"
echo "${!cashCount[@]}"




