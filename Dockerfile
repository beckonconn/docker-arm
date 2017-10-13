FROM resin/rpi-raspbian
MAINTAINER Brad Cesarone bc@beckonconn.com

ENV DATA_DIR=/data \
    BIND_USER=named \
    BIND_GROUP=named

# Update to latest packages and install bind
RUN apt-get update -y && apt-get install bind9 dnsutils -y

# Copy script to container and make it exectuable 
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod 0775 /usr/bin/entrypoint.sh

EXPOSE 53/udp
EXPOSE 53/tcp
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/bin/systemctl enable named"]
CMD ["/bin/systemctl start named"]
