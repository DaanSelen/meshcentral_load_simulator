# Docker Building the MeshCentral agent image

Example:

```shell
docker docker build . \
  --build-arg meshcentral_server='<meshcentral-server-hostname>' \
  --build-arg meshcentral_gid='<meshcentral-group-meshid>' \
  --build-arg meshcentral_aid='<meshcentral-agent-id>' \
  -t docker-meshagent:latest
```
