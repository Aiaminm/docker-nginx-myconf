FROM rockylinux:8
EXPOSE 80

ENV DEBIAN_FRONTEND noninteractive

RUN  yum install wget tar sudo bash curl procps -y


# Install ipfs using ipfs-update and initialize
RUN wget https://dist.ipfs.tech/kubo/v0.18.0/kubo_v0.18.0_linux-amd64.tar.gz \
    && tar -xvzf kubo_v0.18.0_linux-amd64.tar.gz \
    && cd ./kubo \
    && sudo bash install.sh \
    && ipfs init


# config the peers
RUN ipfs swarm peering add /dns4/checkpoint-hk.ipns.network/tcp/4001/p2p/12D3KooWQzZ931qqFJHER6wmmafMdV3ykxULczRsW83o5pJaBMTV
RUN ipfs swarm peering add /dns4/checkpoint-us.ipns.network/tcp/4001/p2p/12D3KooWSgRgfLxfDdi2eDRVBpBYFuTZp39HEBYnJm1upCUJ2GYz
RUN ipfs swarm peering add /dns4/checkpoint-sg.ipns.network/tcp/4001/p2p/12D3KooWNke2bS34fxQrGrnx27UbWMNsWLKDNPEEo8tLyS1K22Ee
RUN ipfs swarm peering add /ip4/103.94.185.112/tcp/4001/p2p/12D3KooWDDV7XzfZtY5Uve6adwFiRXu6J6ypQHALNuA7r9qXvQDr
RUN ipfs swarm peering add /ip4/139.178.91.227/tcp/4001/p2p/12D3KooWKhPb9tSnCqBswVfC5EPE7iSTXhbF4Ywwz2MKg5UCagbr
RUN ipfs swarm peering add /ip4/147.75.63.131/tcp/4001/p2p/12D3KooWHpE5KiQTkqbn8KbU88ZxwJxYJFaqP4mp9Z9bhNPhym9V
RUN ipfs swarm peering add /ip4/147.75.80.143/tcp/4001/p2p/12D3KooWEzCun34s9qpYEnKkG6epx2Ts9oVGRGnzCvM2s2edioLA
RUN ipfs swarm peering add /ip4/147.75.80.39/tcp/4001/p2p/12D3KooWDdzN3snjaMJEH9zuq3tjKUFpYHeSGNkiAreF6dQSbCiL
RUN ipfs swarm peering add /ip4/147.75.33.191/tcp/4001/p2p/12D3KooWPySxxWQjBgX9Jp6uAHQfVmdq8HG1gVvS1fRawHNSrmqW
RUN ipfs swarm peering add /ip4/45.32.104.253/tcp/4001/ws/p2p/12D3KooWPwwFG3szNtp2G4r3F5a49vErPTsd1BKid7JTqtL86JjR
RUN ipfs swarm peering add /ip4/165.227.39.24/tcp/4001/p2p/12D3KooWDSNq8QjS9uvvnQxBkQcVc5jqsVELxxaMvSbo6m2o2zcu
RUN ipfs swarm peering add /ip4/178.79.129.236/tcp/4001/p2p/12D3KooWPJtc5zoUGcPRAqvTvGU3w8gs5FmMQaqvNTnZVQCnD1So
RUN ipfs swarm peering add /ip4/167.99.123.6/tcp/4001/p2p/12D3KooWKsBxZVe4ycB1hkxsFuLkHvkZPtwpi3VMQmNrHhApUTTL
RUN ipfs swarm peering add /ip4/167.99.123.6/udp/4001/quic/p2p/12D3KooWKsBxZVe4ycB1hkxsFuLkHvkZPtwpi3VMQmNrHhApUTTL




# config the gateway endpoint
RUN ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/80


# by default, run `ipfs daemon` to start as a running node
ENTRYPOINT ["ipfs"]
CMD ["daemon"]

