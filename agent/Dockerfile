FROM debian:trixie-slim

WORKDIR /meshagent

# MeshCentral Sever hostname (omit http/https)
ARG meshcentral_server=""
# MeshCentral Group/Mesh ID
ARG meshcentral_gid=""
# MeshCentral Agent ID
ARG meshcentral_aid=""

# Simple check to check if all variables have been passed!
RUN if [ -z "$meshcentral_server" ] || [ -z "$meshcentral_gid" ] || [ -z "$meshcentral_aid" ]; then echo "PLEASE PASS ALL VALUES!"; exit 1; fi

# Upgrade the Container to the latest packages, to prevent things such as CA changes not being in here.
RUN apt update \
    && apt full-upgrade -y \
    && apt install -y wget tzdata \
    && apt clean all -y

# Download and prepare the meshagent binary.
RUN wget -O /meshagent/meshagent "https://${meshcentral_server}/meshagents?id=${meshcentral_gid}&installflags=0&meshinstall=${meshcentral_aid}" \
    && chmod +x /meshagent/meshagent

# Execute the meshagent in the foreground.
CMD ["/meshagent/meshagent", "-connect"]
