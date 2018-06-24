#!/bin/bash
if [ $# -ne 2 ]; then
  echo ./claim.sh wallet_password producer
  exit 0
fi
enucli='/path/to/enucli -u https://rpc.enu.one'
echo $1 | $enucli wallet unlock
$enucli system claimrewards $2
$enucli wallet lock
