FROM gocd/gocd-agent-alpine-3.12:v21.1.0
MAINTAINER HeZhong "hezhong0711@gmail.com"

USER root

RUN apk update && apk add expect && apk add openjdk8 && apk add docker && apk add openrc

COPY entrypoint/entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

USER go
