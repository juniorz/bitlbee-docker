#!/bin/sh

BITLBEE_CONF="/etc/service/bitlbee/bitlbee.conf"

cp /etc/service/bitlbee/bitlbee.conf.default $BITLBEE_CONF

cat <<EOF >> $BITLBEE_CONF

AuthPassword = ${BITLBEE_PASSWD}
OperPassword = ${BITLBEE_OP_PASSWD}
Proxy = socks5://${BITLBEE_TOR_PROXY}
EOF

exec /sbin/setuser bitlbee /usr/sbin/bitlbee \
  -u bitlbee \
  -F \
  -n -v \
  -i 0.0.0.0 \
  -p 6667 \
  -c /etc/service/bitlbee/bitlbee.conf \
  -d /data/bitlbee \
  >> /var/log/bitlbee.log 2>&1

