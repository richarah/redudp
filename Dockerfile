FROM alpine:3.16

RUN apk update
RUN apk add alpine-sdk libevent libevent-dev openssl iptables

ADD . /rs2
WORKDIR /rs2

# For compiling on newer systems
RUN make DISABLE_SHADOWSOCKS=true


