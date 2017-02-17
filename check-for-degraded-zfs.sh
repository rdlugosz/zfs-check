#!/usr/bin/env bash

ZPOOL_STATUS=`/sbin/zpool status`

if [[ $(echo $ZPOOL_STATUS | grep -ic -e "degraded" -e "fault") -ne 0 ]]; then
  echo "OMGWTFBBQ: Something is wrong with the pool!!!!"
  echo ""
  echo $ZPOOL_STATUS
fi
