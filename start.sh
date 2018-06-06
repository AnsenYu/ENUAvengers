#!/bin/bash

if [ $# != 2 ]; then
  echo ./start.sh producername serverip
  exit
fi
BINDIR=/usr/local/bin
if [ ! -f "key.txt" ]; then
  $BINDIR/enucli create key > key.txt
fi

PRONAME=$1
IP=$2
PUBKEY=`cat key.txt | grep Public | awk '{print $3}'`
PRIKEY=`cat key.txt | grep Private | awk '{print $3}'`
echo pubkey: $PUBKEY

DATADIR=~/enudatadir
if [ ! -d $DATADIR ]; then
  mkdir -p $DATADIR
  OPT=""
fi

cp key.txt $DATADIR/key`date +%Y_%m_%d_%H_%M_%S`.txt

OPT="$OPT --signature-provider =$PUBKEY=KEY:$PRIKEY -p $PRONAME --p2p-server-address $IP:9876"

cp config.ini $DATADIR

$BINDIR/enunode $OPT --data-dir $DATADIR --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt & echo $! > $DATADIR/eosd.pid
