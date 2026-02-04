# MeshCentral Load Simulator

First off, we need Docker. Install it [through this link here](https://docs.docker.com/engine/install).  
Then we need to build the agent. Go into that directory:  

```sh
cd ./agent

docker docker build . \
  --build-arg meshcentral_server='<meshcentral-server-hostname>' \
  --build-arg meshcentral_gid='<meshcentral-group-meshid>' \
  --build-arg meshcentral_aid='<meshcentral-agent-id>' \
  -t docker-meshagent:latest
```

After that, run the script or Docker compose file, for example:  

```sh
./deploy <amount of agents> <image-name>
```

An example would be:  

```sh
./deploy 100 docker-meshagent:latest
```

To clean all of them up:  

```
./deploy kill
```

All of the above can be ignored if you are using Docker Compose. Then just use the Docker `compose up`, `compose kill/down` commands.  
