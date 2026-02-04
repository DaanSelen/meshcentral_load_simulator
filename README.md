# MeshCentral Load Simulator

First off, we need Docker. Install it [through this link here](https://docs.docker.com/engine/install).  
Then we need to build the agent. Go into that directory:  

```sh
cd ./agent

docker build agent/ \
  -f agent/Dockerfile \
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

# Example:

$ docker build agent/ -f agent/Dockerfile   --build-arg meshcentral_server='<meshcentral-server-hostname>'   --build-arg meshcentral_gid='<meshcentral-group-meshid>'   --build-arg meshcentral_aid='6'   -t docker-meshagent:latest
[+] Building 0.6s (9/9) FINISHED                                                                                                                                                                   docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                         0.0s
 => => transferring dockerfile: 982B                                                                                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/debian:trixie-slim                                                                                                                                        0.4s
 => [internal] load .dockerignore                                                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                                                              0.0s
 => [1/5] FROM docker.io/library/debian:trixie-slim@sha256:f6e2cfac5cf956ea044b4bd75e6397b4372ad88fe00908045e9a0d21712ae3ba                                                                                  0.0s
 => CACHED [2/5] WORKDIR /meshagent                                                                                                                                                                          0.0s
 => CACHED [3/5] RUN if [ -z "<meshcentral-server-hostname>" ] || [ -z "<meshcentral-group-meshid>" ] || [ -z "6" ]; then echo "PLEASE PASS ALL VALUES!"; exit 1; fi             0.0s
 => CACHED [4/5] RUN apt update     && apt full-upgrade -y     && apt install -y wget tzdata     && apt clean all -y                                                                                         0.0s
 => CACHED [5/5] RUN wget -O /meshagent/meshagent "https://<meshcentral-server-hostname>/meshagents?id=<meshcentral-group-meshid>&installflags=0&meshinstall=6"     && chmod +x  0.0s
 => exporting to image                                                                                                                                                                                       0.0s
 => => exporting layers                                                                                                                                                                                      0.0s
 => => writing image sha256:f2e45ca2be469c699bbca1be707fe5c28c5555918da765ce481aa2507aee9d9a                                                                                                                 0.0s
 => => naming to docker.io/library/docker-meshagent:latest                                                                                                                                                   0.0s

$ ./deploy.sh 25 docker-meshagent:latest
b73e7064bb1b8264d15a8790ae3f1f41208f263b8b863cec88b5dab8d9478f6c
f9a4fd167ed9742615756eeb78711348e4d705ba22b38160e812fccb25ccea69
9a8a646931982b091f9d638c077e14a57b67dbf22741ee9320b979d4a5069fab
1d50cee2c72944ddadfa5597a1657a20c264628e7f65c864c32fe33d6dd60d62
0ae850ea34bea9d7330ef574c2a8dc33f7f4394a1f8d5539b6f2ffe46591c634
5dc1756375ce6382148c40c3651fea92e66dcaad716912a4165daeaf3db1449f
f87e6e2b33b2d481e8715ccf26b93cf6664b45980a992a26c4463e45c0f73a45
1bb9846a8797e1d3f55b710d9eec4115dcf427fc313852c173c5b9599dc6fdcb
412b0c452a254d4f9936cc0e0a7a262e39c6fd19e96c5b7b0a041984b0519608
7f7c2907d52de128e402ebe9f4c271824193dd224b0ee0c56f4934489efa4ce1
77a7c3ba7e34983cfd44e43a03a81980bc2c423562518065d1553e2195fb0ac9
f542588186d216d0aa650613b40247d0f94b41e37563336219a78a4026f0dd36
f13438d6d6bfd508aeb48baa1613b7613b52fe61fababc6fb06fa42d407c5ce0
9e30046ba5f70afcab572de246db3f58bbac48c6f2ba9f6d958af0d19b7e2be5
bf0dd26548576e70fe792284ce34d01d4ddca6c5a593a95a7ffc5cadcddd1185
406f39e208ac095a8a8276e3a40f7f6b157b161b47dc96147af51800d54e3227
8e2baa6ffdb0d12da11805f4f7c965b63197f839a650df196228b4df2ac4f676
b4e61887d390b789a70b10adcd233bf6cd3f7a05cb193e551ed6650d760438b6
1cdbdbbe316dbee182a1936d2b4bef36390e06200bf57a142f0dcdcb072d6316
a70dfa3962dbf4959e08e145c343f8036e69e4a1c84ac874ef54d698561627db
7da209519e394ab011a2045a0b7f144ece3b4573533f0603c404bd629c2ac615
b6a1eca04b7b3699111c9a34089f2342298bdf32fe07d9364f358eace164d61d
07550c66a869676cd1f455117ced53fd644265af7102844b0d816b4f185e5068
3b95973c77206ee7d9343f86afdcf57940b47db677d15f455f3f20ccc8b7d21e
ae110f8b2ad6b0c92f9d2f5e90eafdce9ff10709cf207097039cfa9857d8e75f

$ ./deploy.sh kill
Issuing a kill
ae110f8b2ad6
3b95973c7720
07550c66a869
b6a1eca04b7b
7da209519e39
a70dfa3962db
1cdbdbbe316d
b4e61887d390
8e2baa6ffdb0
406f39e208ac
bf0dd2654857
9e30046ba5f7
f13438d6d6bf
f542588186d2
77a7c3ba7e34
7f7c2907d52d
412b0c452a25
1bb9846a8797
f87e6e2b33b2
5dc1756375ce
0ae850ea34be
1d50cee2c729
9a8a64693198
f9a4fd167ed9
b73e7064bb1b
