#!/bin/bash
cd
mkdir enudatadir
BINDIR=/usr/local/bin
DATADIR=./enudatadir

if [ "$1" = "bootstrap" ]
then
OPT="--enable-stale-production"
fi

$BINDIR/enunode $OPT --data-dir $DATADIR --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt & echo $! > $DATADIR/eosd.pid
