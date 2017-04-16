#!/bin/sh

if [ $# -eq 0 ]; then
  proxybroker grab --limit 1000 | sed -nr 's/.*\[\] (.*)>.*/\1/p' >> proxylist.txt
else
  exec "$@"
fi
