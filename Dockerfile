FROM rockylinux:latest
LABEL maintainer "Baohua Yang <yangbaohua@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN  yum install wget tar sudo bash curl -y

# enable cloudflare warp ipv6
RUN /bin/bash <(curl -fsSL git.io/warp.sh) 6


# Install ipfs using ipfs-update and initialize
RUN wget https://dist.ipfs.io/go-ipfs/v0.12.2/go-ipfs_v0.12.2_linux-amd64.tar.gz \
    && tar -xvzf go-ipfs_v0.12.2_linux-amd64.tar.gz \
    && cd ./go-ipfs \
    && sudo bash install.sh \
    && ipfs init


# config the gateway endpoint
RUN ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/80


# by default, run `ipfs daemon` to start as a running node
ENTRYPOINT ["ipfs"]
CMD ["daemon"]

