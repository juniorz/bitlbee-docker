## bitlbee

### Instructions

Start the container

    $ docker run -e BITLBEE_PASSWD=userpass \
                 -e BITLBEE_OP_PASSWD=oppass \
                 -e BITLBEE_TOR_PROXY=host:port \
                 -d -p 1234:6667 \
                 juniorz/bitlbee

Connect to the IRC server on dockerhost:1234 with server password set to 
`BITLBEE_PASSWD`.

The image provides a data volume at `/data/bitlbee` so the user data can be
persisted.
