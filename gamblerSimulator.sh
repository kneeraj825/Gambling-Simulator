
#!/bin/bash -x

echo Welcome
#constants
STAKE_PER_DAY=100
BET_EACH_CHANCE=1
IS_WIN=1
#variables
cash=STAKE_PER_DAY
MAXIMUM_WIN=$(($STAKE_PER_DAY + $STAKE_PER_DAY/2))
MAXIMUM_LOOSE=$(($STAKE_PER_DAY/2))
#checking maximum win ansd loose
winCheck=$(( RANDOM%2 ))
while (( $cash != $MAXIMUM_WIN && $cash != $MAXIMUM_LOOSE ))
do
if (( $IS_WIN == winCheck ))
then
   ((cash++))
else
   ((cash--))
fi
done
echo "your limit is over for today: $cash"

