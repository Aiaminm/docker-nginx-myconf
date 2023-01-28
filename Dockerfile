FROM rockylinux:8
LABEL maintainer "Baohua Yang <yangbaohua@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN  yum install wget tar sudo bash curl procps -y


# Install ipfs using ipfs-update and initialize
RUN wget https://dist.ipfs.tech/kubo/v0.18.0/kubo_v0.18.0_linux-amd64.tar.gz \
    && kubo_v0.18.0_linux-amd64.tar.gz \
    && cd ./kubo \
    && sudo bash install.sh \
    && ipfs init


# config the gateway endpoint
RUN ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/80


# by default, run `ipfs daemon` to start as a running node
ENTRYPOINT ["ipfs"]
CMD ["daemon"]

