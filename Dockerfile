FROM phusion/baseimage

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN apt-get install -y bitlbee bitlbee-plugin-otr

EXPOSE 6667
#RUN useradd -d /etc/service/tor-proxy -s /bin/false tor
RUN mkdir -p /etc/service/bitlbee
ADD bitlbee.conf /etc/service/bitlbee/bitlbee.conf.default
ADD bitlbee.sh /etc/service/bitlbee/run

RUN mkdir -p /data/bitlbee &&\
  chown bitlbee:bitlbee /data/bitlbee

VOLUME /data/bitlbee

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*