#!/bin/bash

BASE_DIR=/opt/janus

PATH=${BASE_DIR}/bin:${PATH}
LD_LIBRARY_PATH=/usr/lib:${BASE_DIR}/lib:${BASE_DIR}/lib/janus/transports:${BASE_DIR}/lib/janus/plugins:${LD_LIBRARY_PATH}

# Patch Config to enable Event Handler
#CFG_EVENT='/root/janus/etc/janus/janus.eventhandler.sampleevh.cfg'
#sed 's/enabled = no/enabled = yes/1' -i $CFG_EVENT
#echo 'backend = http://localhost:7777' >> $CFG_EVENT

CFG_JANUS="${BASE_DIR}/etc/janus/janus.cfg"
/bin/sed 's/; broadcast = yes/broadcast = yes/1' -i $CFG_JANUS

CFG_HTTPS="${BASE_DIR}/etc/janus/janus.transport.http.cfg"
/bin/sed 's/https = no/https = yes/1' -i $CFG_HTTPS
/bin/sed 's/;secure_port = 8089/secure_port = 8089/1' -i $CFG_HTTPS

http-server ${BASE_DIR}/share/janus/demos/ --key ${BASE_DIR}/share/janus/certs/mycert.key --cert ${BASE_DIR}/share/janus/certs/mycert.pem -d false -p 8080 -c-1 --ssl &

# Start Janus Gateway in forever mode
${BASE_DIR}/bin/janus --stun-server=stun.l.google.com:19302 -L /var/log/meetecho --rtp-port-range=10000-10200
