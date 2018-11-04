#!/bin/bash
RPC="https://filter.qsx.io"

# generate non-signed transaction of setting contract of enu.msig
enucli -u $RPC set contract -s -j -d enu.msig ../build/enu.msig > upgrade_enumsig_contract_trx.json


# leader modify the expiration of the upgrade_enumsig_contract_trx.json
# make it some time (less than 9 hours) in the future
