FROM gocd/gocd-server:v21.1.0
MAINTAINER HeZhong "hezhong0711@gmail.com"

USER root

RUN apk update && apk add openjdk8

USER go
