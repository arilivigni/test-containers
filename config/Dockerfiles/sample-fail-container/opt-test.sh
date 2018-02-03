#!/bin/bash
set -xeo pipefail

echo "Take option to fail or succeed building of a container"
echo "sleep for 60 before deciding to succeed or fail"
sleep 60

if [ "$FAIL_IT" = true ] ; then
    echo "YOU HAVE CHOSEN TO FAIL THE IMAGE BUILD"
    exit 1
fi

echo "YOU HAVE CHOSEN TO EXECUTE THE IMAGE BUILD"
exit 0
