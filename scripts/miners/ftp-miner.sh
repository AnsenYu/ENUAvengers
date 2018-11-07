#!/bin/bash

# !!!!!! change to your account
account=bitcoin.enu

while true; do

        # unlock wallet
	# !!!!!!! change to unlock you wallet
	sh /home/ubuntu/unlock.sh

	# use all ENU balance to mine
	enu_amount=`/usr/local/enumivo/bin/enucli -u https://rpc.enu.one get currency balance enu.token $account ENU`

	if [ -n "$enu_amount" ]; then
	    echo "=========== ENU => BTC ==============="
	    echo /usr/local/enumivo/bin/enucli -u https://rpc.enu.one transfer  $account enu.btc.coin \"$enu_amount\"
	    echo /usr/local/enumivo/bin/enucli -u https://rpc.enu.one transfer  $account enu.btc.coin \"$enu_amount\" | bash
        fi

	sleep 1

	btc_amount=`/usr/local/enumivo/bin/enucli -u https://rpc.enu.one get currency balance iou.coin $account BTC`

	if [ -n "$btc_amount" ]; then
	    echo "=========== BTC => ENU ==============="
 	    param="[\"$account\",\"enu.btc.coin\",\"$btc_amount\",\"\"]"
	    cmd="/usr/local/enumivo/bin/enucli -u https://rpc.enu.one push action iou.coin transfer '$param' -p $account@active"
	    echo $cmd
	    echo $cmd | bash
	fi

	sleep 1
done
