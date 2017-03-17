#!/bin/sh

if [ $# -eq 0 ]; then
  cat /dev/null > proxies.txt
  proxybroker grab --limit 1000 | sed -nr 's/.*\[\] (.*)>.*/\1/p' >> proxies.txt
  go-proxycheck -treds=${JOBS} -url=${SITE} -in=proxies.txt
else
  exec "$@"
fi
