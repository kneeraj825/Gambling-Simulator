#!/bin/bash -x

echo Welcome
#constants
STAKE_PER_DAY=100
BET_EACH_CHANCE=1
IS_WIN=1
total_Cash_After_Month=0
days=20
secondCash=$STAKE_PER_DAY
#variables
SumOfCash=STAKE_PER_DAY
#storing the  days count
for ((  count=1; count<=days; count++))
do
	cash=$STAKE_PER_DAY
	MAXIMUM_WIN=$(($STAKE_PER_DAY + $STAKE_PER_DAY/2))
	MAXIMUM_LOOSE=$(($STAKE_PER_DAY/2))
	while (( $cash != $MAXIMUM_WIN && $cash != $MAXIMUM_LOOSE ))
	do

#checking the random win or loose
		winCheck=$(( RANDOM%2 ))
		if (( $IS_WIN == $winCheck ))
		then
			((cash++))
		else
			((cash--))
		fi
		SumOfCash=$(($cash-$STAKE_PER_DAY))
	done
	SumOfCash[count]=$cash
	total_Cash_After_Month=$(($total_Cash_After_Month+$SumOfCash))
	total_Cash_After_Month[count]=$total_Cash_After_Month
done
echo "${SumOfCash[@]}"
echo "${!SumOfCash[@]}"
echo "${total_Cash_After_Month[@]}"
echo "total SumOfCash of 20 days: $total_Cash_After_Month"
echo "Luckiest Day:"
	for k in ${!total_Cash_After_Month[@]}
	do
		echo  $k '-' ${total_Cash_After_Month[$k]}
	done | sort -rn -k3 | head -1
		echo "UnLuckiest Day:"
	for k in ${!total_Cash_After_Month[@]}
	do
		echo  $k '-' ${total_Cash_After_Month[$k]}
	done | sort -rn -k3 | tail -1

echo "total SumOfCash of 20 days: $total_Cash_After_Month"

