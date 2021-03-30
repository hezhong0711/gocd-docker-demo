# GoCD-Docker-Demo
## GoCD-Server

### Build image
```bash
docker build -f server.dockerfile -t hezhong0711/gocd-server-jdk8 .
```

### Start gocd server
```bash
docker run -d -p8153:8153 \
  -v /PATH/TO/GODATA:/godata \
  -v /PATH/TO/HOME:/home/go \
  -e GOCD_PLUGIN_INSTALL_docker-registry-artifact-plugin=https://github.com/gocd/docker-registry-artifact-plugin/releases/download/v1.3.0-138-exp/docker-registry-artifact-plugin-1.3.0-138.jar \
  hezhong0711/gocd-server-jdk8
```

## GoCD-Agent

### Build image command
```bash
docker build -f agent.dockerfile -t hezhong0711/gocd-agent-jdk8 .
```

### Start docker command
```bash
docker run -d \
  -e GO_SERVER_URL=http://$(docker inspect --format='{{(index (index .NetworkSettings.IPAddress))}}' GOCD_SERVER_NAME):8153/go \
  -v '/var/run/docker.sock:/var/run/docker.sock:rw' hezhong0711/gocd-agent-jdk8:latest
```
