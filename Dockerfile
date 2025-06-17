FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y squid && \
    rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/squid.conf

CMD ["squid", "-N", "-d", "1"]
