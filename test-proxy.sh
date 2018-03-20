#!/usr/bin/env bash

export http_proxy='http://18.216.52.241:3128/'

OUTPUT_FILE=/tmp/$$.txt
    wget -nv --proxy-user=test --proxy-password=test google.com > ${OUTPUT_FILE} 2>&1

grep -q '<H1>You cant use internet</H1>' ${OUTPUT_FILE}
if [ "$?" -eq '0' ]
then
    echo "Proxy isnt working. " | mail -s "Proxy isnt working" -r "No-reply<no-reply@mail.cz>" test@mail.cz
else
    echo "Proxy is working"
fi

rm -f /tmp/$$.txt