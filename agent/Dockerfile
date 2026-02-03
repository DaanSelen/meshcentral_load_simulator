FROM debian:trixie-slim

WORKDIR /meshagent

RUN apt update && apt dist-upgrade -y && apt install -y wget tzdata && apt clean all -y

ARG meshcentral_server
ARG meshcentral_gid

RUN wget -O /meshagent/meshagent "https://${meshcentral_server}/meshagents?id=${meshcentral_gid}&installflags=0&meshinstall=6" \
    && chmod +x /meshagent/meshagent

CMD ["/meshagent/meshagent", "-connect"]
