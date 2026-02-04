FROM debian:trixie-slim

WORKDIR /meshagent

RUN apt update && apt dist-upgrade -y && apt install -y wget tzdata && apt clean all -y

# MeshCentral Sever hostname (omit http/https)
ARG meshcentral_server

# MeshCentral Group/Mesh ID
ARG meshcentral_gid

# MeshCentral Agent ID
ARG meshcentral_aid

RUN wget -O /meshagent/meshagent "https://${meshcentral_server}/meshagents?id=${meshcentral_gid}&installflags=0&meshinstall=${meshcentral_aid}" \
    && chmod +x /meshagent/meshagent

CMD ["/meshagent/meshagent", "-connect"]
