#!/bin/sh
if [ $# -eq 0 ]; then
  if [ ! -f good_list.txt ]; then
    touch good_list.txt
  fi
  proxybroker grab --limit 1000 --outfile ./proxies.txt
  parallel -j${JOBS} "proxy_check.sh {}" <proxies.txt
else
  exec "$@"
fi
