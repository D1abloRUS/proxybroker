#!/bin/sh

PROXY=$(echo "${1}" | sed -nr 's/.*\[\] (.*)>/\1/p')
IP=$(echo ${PROXY} | sed 's/:.*//')
STATUS=$(curl --max-time 2 -s -x ${PROXY} -o /dev/null -w '%{http_code}' ${SITE})
CHECK_IN_LIST=$(cat good_list.txt | grep ${IP} 2>/dev/null)
if [ -z "$CHECK_IN_LIST" ]; then
  if [ ${STATUS} -eq 200 ]; then
    echo GOOD: ${PROXY}
    echo "${PROXY}" >> good_list.txt
  else
    echo BAD: ${PROXY}
    echo "${PROXY}" >> bad_list.txt
  fi
fi
