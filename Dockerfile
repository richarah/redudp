FROM debian:bullseye

ENV DOCKER_NET="docker0"
ENV DEBIAN_FRONTEND="noninteractive"

WORKDIR /
RUN apt-get update
RUN apt-get install -y build-essential libevent libevent-dev openssl openssl-dev iptables iptables-dev nss nss-dev

ADD . /rs2
WORKDIR /rs2
COPY redsocks.conf /etc/redsocks.conf

# For compiling on newer systems
RUN make DISABLE_SHADOWSOCKS=true

# ENTRYPOINT ["./rs2/redsocks2 -c /etc/redsocks.conf"]
